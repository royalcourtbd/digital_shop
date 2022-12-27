import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/categoryPage/model/category_model.dart';
import 'package:digital_shop/apps/productPage/model/products_model.dart';
import 'package:get/get.dart';

import '../../../general/constants/constants.dart';
import '../../../general/constants/url.dart';

class CategoryPageController extends GetxController {
  static CategoryPageController instance = Get.find();

  @override
  void onReady() {
    super.onReady();
    categoryList.bindStream(categoryItemList());
  }

  @override
  void onInit() {
    super.onInit();
    categoryList.bindStream(categoryItemList());
  }

  final categoryList = RxList<CategoryModel>([]);

  int get categoryLength => categoryList.length;

//fetch Category from Firebase
  Stream<List<CategoryModel>> categoryItemList() =>
      firestore.collection(Urls.CATEGORY_COLLECTION).snapshots().map(
            (query) => query.docs
                .map(
                  (item) => CategoryModel.fromJson(
                    item.data(),
                  ),
                )
                .toList(),
          );

  //

  // Stream<List<ProductModel>> getAllProductsByCategory(String category) =>
  //     firestore
  //         .collection(Urls.PRODUCTS_COLLECTION)
  //         .where('category', isEqualTo: category)
  //         .snapshots()
  //         .map(
  //           (query) => query.docs
  //               .map(
  //                 (item) => ProductModel.fromJson(
  //                   item.data(),
  //                 ),
  //               )
  //               .toList(),
  //         );
  final getProductByCategory = RxList<ProductModel>([]);

//fetch Category Products by Category Name from Firebase
  getProducts(String category) async {
    var response = await firestore
        .collection(Urls.PRODUCTS_COLLECTION)
        .where('category', isEqualTo: category)
        .where('available', isEqualTo: true)
        .get();
    productsMap(response);
  }

  productsMap(QuerySnapshot<Map<String, dynamic>> response) async {
    var list = response.docs
        .map(
          (e) => ProductModel.fromJson(e.data()),
        )
        .toList();
    getProductByCategory.value = list;
  }

  productsSnapshot(String category) {
    firestore
        .collection(Urls.PRODUCTS_COLLECTION)
        .where('category', isEqualTo: category)
        .where('available', isEqualTo: true)
        .snapshots()
        .listen(
      (response) {
        productsMap(response);
      },
    );
  }

  ///
}
