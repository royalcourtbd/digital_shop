import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/categoryPage/model/category_model.dart';
import 'package:digital_shop/apps/productPage/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constants/constants.dart';
import '../../../general/constants/url.dart';

class CategoryPageController extends GetxController {
  static CategoryPageController instance = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final categoryList = RxList<CategoryModel>([]);
  final getProductByCategory = RxList<ProductModel>([]);

  int get categoryLength => categoryList.length;

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
