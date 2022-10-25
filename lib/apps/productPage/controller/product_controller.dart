import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/productPage/model/products_model.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:get/get.dart';

import '../../../general/constants/constants.dart';

import '../../../general/constants/url.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  RxList productsList = [].obs;

  RxList<ProductModel> favoritProduct = RxList<ProductModel>([]);

  //GlobalKey<CarouselSliderState> sliderKey = GlobalKey();

  @override
  onInit() {
    getProducts();
    productsSnapshot();
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    favoritProduct.bindStream(getFavoritProducts());
  }

  Stream<List<ProductModel>> getFavoritProducts() =>
      firestore.collection(Urls.FAVOURITEDEALS_COLLECTION).snapshots().map(
            (query) => query.docs
                .map(
                  (item) => ProductModel.fromJson(
                    item.data(),
                  ),
                )
                .toList(),
          );

  getProducts() async {
    var response = await firestore.collection(Urls.PRODUCTS_COLLECTION).get();
    productsMap(response);
  }

  productsMap(QuerySnapshot<Map<String, dynamic>> response) async {
    var list = response.docs
        .map(
          (e) => ProductModel.fromJson(e.data()),
        )
        .toList();
    productsList.value = list;
  }

  productsSnapshot() {
    firestore.collection(Urls.PRODUCTS_COLLECTION).snapshots().listen(
      (response) {
        productsMap(response);
      },
    );
  }

  RxDouble productPercentage = 0.0.obs;
  //RxDouble one = 0.0.obs;
  calculatePercentage(double discountPrice, double currentPrice) {
    productPercentage.value = 100 - ((discountPrice / currentPrice) * 100);
    return productPercentage.value;
  }
}
