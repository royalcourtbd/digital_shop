import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/cartPage/model/cart_item_model.dart';
import 'package:digital_shop/apps/productPage/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constants/constants.dart';
import '../../../general/constants/url.dart';

class CartPageController extends GetxController {
  static CartPageController instance = Get.find();

  get firestoreCartList => firestore
      .collection(Urls.USER_COLLECTION)
      .doc(auth.currentUser!.uid)
      .collection(Urls.CART_COLLECTION);

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    cartItemList.bindStream(cartList());
  }

  @override
  void onInit() {
    super.onInit();
    cartItemList.bindStream(cartList());
  }

  RxList cartItemList = [].obs;

  int get cartLength => cartItemList.length;

  double get totalPrice => cartItemList.fold(
        0,
        (sum, item) => sum + double.parse(item.productTotalPrice.toString()),
      );

  bool isAlreadyAdded(ProductModel productModel) => cartItemList
      .where((item) => item.productId == productModel.productId)
      .isNotEmpty;

  var amount;
  double calculate(double discountPrice, int quantity) {
    amount = discountPrice * quantity;
    return amount;
  }

  Future<void> incrementQuantity(int index) async {
    print(cartItemList[index].quantity);
    //update firestore *total price & quantity

    calculate(
      cartItemList[index].discountPrice!.toDouble(),
      cartItemList[index].quantity + 1,
    );
    await firestoreCartList.doc(cartItemList[index].docId!).update(
      {
        'productTotalPrice': amount,
        'quantity': FieldValue.increment(1),
      },
    );
  }

  Future<void> decreaseQuantity(int index) async {
    print(cartItemList[index].quantity);
    if (cartItemList[index].quantity >= 2) {
      cartItemList[index].quantity--;
    } else {
      deleteItem(cartItemList[index].docId.toString());
    }
    calculate(
      cartItemList[index].discountPrice!.toDouble(),
      cartItemList[index].quantity,
    );
    await firestoreCartList.doc(cartItemList[index].docId.toString()).update(
      {
        'productTotalPrice': amount,
        'quantity': FieldValue.increment(-1),
      },
    );
  }

//fetch cart Data to firebase firestore
  Stream<List<CartModel>> cartList() => firestore
          .collection(Urls.USER_COLLECTION)
          .doc(auth.currentUser!.uid)
          .collection(Urls.CART_COLLECTION)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((query) {
        return query.docs.map(
          (item) {
            String docId = item.id;

            return CartModel(
              docId: item.id,
              cartId: item["cartId"],
              createdAt: item["createdAt"],
              discountPrice: double.parse(item["discountPrice"].toString()),
              image: item["image"],
              price: double.parse(item["price"].toString()),
              productId: item["productId"],
              productName: item["productName"],
              productTotalPrice:
                  double.parse(item["productTotalPrice"].toString()),
              quantity: int.parse(item["quantity"].toString()),
              userId: item["userId"],
            );
          },
        ).toList();
      });

  //

  addProducToCart(context, ProductModel productModel) async {
    try {
      if (isAlreadyAdded(productModel)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${productModel.productName!} already added to tha cart',
              style: const TextStyle(color: Colors.black54),
            ),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red.shade100,
          ),
        );
      } else {
        cartItem(
          UniqueKey().toString(),
          auth.currentUser!.uid,
          productModel.docId!,
          productModel.productId!,
          productModel.image!,
          productModel.productName!,
          double.parse(productModel.price!),
          double.parse(productModel.discountPrice!),
          calculate(double.parse(productModel.discountPrice.toString()), 1),
          1,
          DateTime.now().toString(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${productModel.productName!} Successfully added to the cart',
            ),
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green.shade100,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("cannot added to the cart"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  cartItem(
    String cartId,
    String userId,
    String docId,
    String productId,
    String image,
    String productName,
    double price,
    double discountPrice,
    double productTotalPrice,
    int quantity,
    String createdAt,
  ) async {
    var cartItem = CartModel(
      cartId: cartId,
      docId: docId,
      userId: userId,
      productId: productId,
      image: image,
      productName: productName,
      price: price,
      discountPrice: discountPrice,
      productTotalPrice: productTotalPrice,
      quantity: quantity,
      createdAt: createdAt,
    );
    await firestore
        .collection(Urls.USER_COLLECTION)
        .doc(auth.currentUser!.uid)
        .collection(Urls.CART_COLLECTION)
        .add(cartItem.toJson());
  }

//Delete Cart Item
  deleteItem(String id) {
    firestore
        .collection(Urls.USER_COLLECTION)
        .doc(auth.currentUser!.uid)
        .collection(Urls.CART_COLLECTION)
        .doc(id)
        .delete();
  }
}
