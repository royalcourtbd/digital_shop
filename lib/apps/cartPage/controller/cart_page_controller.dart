import 'package:digital_shop/apps/productPage/model/products_model.dart';
import 'package:get/get.dart';

class CartPageController extends GetxController {
  RxList cartItemList = [].obs;

  int get cartLength => cartItemList.length;

  double get totalPrice =>
      cartItemList.fold(0, (sum, item) => sum + item.discountPrice);

  addToCart(ProductModel productModel) async {
    await Future.delayed(const Duration(seconds: 1));
    cartItemList.add(productModel);
  }
}
