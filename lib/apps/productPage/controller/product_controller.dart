import 'package:digital_shop/apps/productPage/model/products_model.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../general/constants/url.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  //RxList productsList = [].obs;

  RxList<ProductModel> featuredProduct = RxList<ProductModel>([]);
  RxList<ProductModel> productsList = RxList<ProductModel>([]);
  TextEditingController searchController = TextEditingController();

  //GlobalKey<CarouselSliderState> sliderKey = GlobalKey();

  @override
  onInit() {
    productsList.bindStream(getProduct());
    featuredProduct.bindStream(getFeaturedProducts());
    // getProducts();
    // productsSnapshot();
    super.onInit();
  }

  @override
  void onClose() {
    mainPageController.initAdd();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    featuredProduct.bindStream(getFeaturedProducts());
    productsList.bindStream(getProduct());
  }

  Stream<List<ProductModel>> getProduct() => firestore
          .collection(Urls.PRODUCTS_COLLECTION)
          .where('available', isEqualTo: true)
          .snapshots()
          .map(
        (query) {
          return query.docs
              .map(
                (item) => ProductModel.fromJson(item.data()),
              )
              .toList();
        },
      );
  Stream<List<ProductModel>> getFeaturedProducts() => firestore
          .collection(Urls.PRODUCTS_COLLECTION)
          .where('featured', isEqualTo: true)
          .where('available', isEqualTo: true)
          .snapshots()
          .map(
        (query) {
          return query.docs
              .map(
                (item) => ProductModel.fromJson(item.data()),
              )
              .toList();
        },
      );

  // getProducts() async {
  //   var response = await firestore.collection(Urls.PRODUCTS_COLLECTION).get();
  //   productsMap(response);
  // }

  // productsMap(QuerySnapshot<Map<String, dynamic>> response) async {
  //   var list = response.docs
  //       .map(
  //         (e) => ProductModel.fromJson(e.data()),
  //       )
  //       .toList();
  //   productsList.value = list;
  // }

  // productsSnapshot() {
  //   firestore.collection(Urls.PRODUCTS_COLLECTION).snapshots().listen(
  //     (response) {
  //       productsMap(response);
  //     },
  //   );
  // }

  RxDouble productPercentage = 0.0.obs;
  //RxDouble one = 0.0.obs;
  calculatePercentage(double discountPrice, double currentPrice) {
    productPercentage.value = 100 - ((discountPrice / currentPrice) * 100);
    return productPercentage.value;
  }
}
