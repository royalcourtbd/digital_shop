import 'package:digital_shop/apps/cartPage/model/cart_item_model.dart';
import 'package:digital_shop/apps/productPage/model/products_model.dart';
import 'package:get/get.dart';

import '../../../general/constants/constants.dart';
import '../../../general/constants/url.dart';

class CartPageController extends GetxController {
  static CartPageController instance = Get.find();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    cartItemList.bindStream(cartList());
  }

  RxList cartItemList = [].obs;
  RxInt quantity = 1.obs;
  increment() => quantity.value++;
  decrement() => quantity.value--;

  int get cartLength => cartItemList.length;

  double get totalPrice => cartItemList.fold(
        0,
        (sum, item) => sum + double.parse(item.discountPrice),
      );

  Stream<List<CartModel>> cartList() => firestore
          .collection(Urls.USERCOLLECTION)
          .doc(auth.currentUser!.uid)
          .collection(Urls.CARTCOLLECTION)
          .snapshots()
          .map((query) {
        return query.docs
            .map(
              (item) => CartModel(
                docId: item.id,
                cartId: item["cartId"],
                createdAt: item["createdAt"],
                discountPrice: item["discountPrice"],
                image: item["image"],
                price: item["price"],
                productId: item["productId"],
                productName: item["productName"],
                productTotalPrice: item["productTotalPrice"],
                quantity: item["quantity"],
                userId: item["userId"],
              ),
            )
            .toList();
      });

  addProducToCart(ProductModel productModel) async {
    try {
      cartItem(
        '5',
        auth.currentUser!.uid,
        productModel.id,
        productModel.image,
        productModel.productName,
        productModel.price,
        productModel.discountPrice,
        quantity.value.toString(),
        DateTime.now().toString(),
      );

      // Get.snackbar(
      //   'item added',
      //   '${productModel.productName}was added to tha cart',
      // );
    } catch (e) {
      Get.snackbar('Error', "cannot added to the cart"); //
    }
  }

  cartItem(
    String cartId,
    String userId,
    String productId,
    String image,
    String productName,
    String price,
    String discountPrice,
    String quantity,
    String createdAt,
  ) async {
    var cartItem = CartModel(
      cartId: cartId,
      userId: userId,
      productId: productId,
      image: image,
      productName: productName,
      price: price,
      discountPrice: discountPrice,
      quantity: quantity,
      createdAt: createdAt,
    );
    await firestore
        .collection(Urls.USERCOLLECTION)
        .doc(auth.currentUser!.uid)
        .collection(Urls.CARTCOLLECTION)
        .add(cartItem.toJson());
  }

//Delete Cart Item
  deleteItem(String id) {
    firestore
        .collection(Urls.USERCOLLECTION)
        .doc(auth.currentUser!.uid)
        .collection(Urls.CARTCOLLECTION)
        .doc(id)
        .delete();
  }
}
