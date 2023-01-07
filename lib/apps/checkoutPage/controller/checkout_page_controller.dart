import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/checkoutPage/model/charge_model.dart';
import 'package:digital_shop/apps/checkoutPage/model/order_model.dart';
import 'package:digital_shop/apps/mainPage/screen/main_page_view.dart';
import 'package:digital_shop/apps/success_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../../general/constants/constants.dart';
import '../../../general/constants/url.dart';
import '../../cartPage/model/cart_item_model.dart';
import '../../productPage/model/products_model.dart';

class CheckoutPageController extends GetxController {
  static CheckoutPageController instance = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Rx<ChargeHistoryModel?> charge = ChargeHistoryModel().obs;

  @override
  void onInit() {
    getChargeFromDB();
    super.onInit();
  }

  @override
  void onClose() {
    mainPageController.initAdd();
    super.onClose();
  }

  @override
  void onReady() {
    getChargeFromDB();
    super.onReady();
  }

  getChargeFromDB() async {
    try {
      firestore
          .collection(Urls.SettingsCollection)
          .doc('charge')
          .snapshots()
          .listen((event) {
        charge.value = ChargeHistoryModel.fromJson(event.data()!);
      });
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  getDiscountAmount(double subtotal) {
    return (subtotal * charge.value!.discount!) / 100.round();
  }

  getVatAmount(double subtotal) {
    final priceAfterDiscount = subtotal - getDiscountAmount(subtotal);
    return (priceAfterDiscount * charge.value!.vat!) / 100.round();
  }

  getGrandTotal(double subtotal) {
    return (subtotal - getDiscountAmount(subtotal)) +
        getVatAmount(subtotal) +
        charge.value!.deliveryFee!.round();
  }

//
  checkoutProduct(
      List<ProductModel> productList, List<CartModel> cartList) async {
    try {
      if (cartList.isEmpty) {
        print('Plase Add address');
      } else {
        EasyLoading.show();
        await Future.delayed(const Duration(seconds: 2));
        EasyLoading.dismiss();
        addNewOrder(
          UniqueKey().toString().replaceAll('[#', '').replaceAll(']', ''),
          auth.currentUser!.uid,
          DateTime.now().toString(),
          'Pending',
          "Cash On Delivery",
          double.parse(charge.value!.deliveryFee!.toString()),
          double.parse(getDiscountAmount(cartPageController.totalPrice)
              .round()
              .toString()),
          double.parse(
            getGrandTotal(cartPageController.totalPrice).round().toString(),
          ),
          'deliveryAddress',
          cartList,
          productList,
        );

        Get.offAll(const OrderSuccessfulPage());
        mainPageController.interstitialAd.show();
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  addNewOrder(
    String orderId,
    String uid,
    String orderDate,
    String orderStatus,
    String paymentMethod,
    double deliveryCharge,
    double discount,
    double grandTotal,
    String deliveryAddress,
    List<CartModel> cartList,
    List<ProductModel> product,
  ) async {
    final id = firestore.collection(Urls.OrderProducts).doc().id;
    final docRef = firestore.collection(Urls.OrderProducts).doc(id);

    var addOrder = OrderModel(
      docId: id,
      orderId: orderId,
      uid: uid,
      orderDate: orderDate,
      orderStatus: orderStatus,
      paymentMethod: paymentMethod,
      deliveryCharge: deliveryCharge,
      discount: discount,
      grandTotal: grandTotal,
      deliveryAddress: deliveryAddress,
    );
//add order
    await docRef.set(addOrder.toJson()).then((_) async {
      //add order details
      for (var cartItem in cartList) {
        final cartDoc =
            docRef.collection('OrderDetails').doc(cartItem.productId);
        await cartDoc.set(cartItem.toJson()).then(
          (_) async {
            //update stock and total sell
            for (var item in product) {
              final productDoc = firestore
                  .collection(Urls.PRODUCTS_COLLECTION)
                  .doc(cartItem.docId);

              log(productDoc.toString());

              await productDoc.update({
                'totalSell': (item.totalSell! + cartItem.quantity!),
                'quantity': (item.quantity! - cartItem.quantity!),
              }).then((value) async {
                //delete cart item
                final userDoc =
                    firestore.collection(Urls.USER_COLLECTION).doc(uid);

                final cartDoc = userDoc
                    .collection(Urls.CART_COLLECTION)
                    .doc(cartItem.docId);
                await cartDoc.delete();
              });
            }
          },
        );
      }
    });
  }
}
