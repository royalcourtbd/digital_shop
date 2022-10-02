import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/homePage/model/carousel_model.dart';
import 'package:digital_shop/general/constants/url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxList carouselSliderList = [].obs;

  List icon = [
    Icons.announcement_outlined,
    Icons.favorite_border,
    Icons.dashboard_outlined,
    Icons.assignment_outlined,
  ];

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  //GlobalKey<CarouselSliderState> sliderKey = GlobalKey();

  @override
  onInit() {
    getCarouselImage();
    carouselSnapshot();
    super.onInit();
  }

  getCarouselImage() async {
    var response = await firestore.collection(Urls.CAROUSEL_IMAGE).get();
    carouselMap(response);
  }

  carouselMap(QuerySnapshot<Map<String, dynamic>> response) async {
    var imageList = response.docs
        .map(
          (e) => CarouselModel(
            imagePath: e['imagePath'],
            id: e['id'],
          ),
        )
        .toList();
    carouselSliderList.value = imageList;
  }

  carouselSnapshot() {
    firestore.collection(Urls.CAROUSEL_IMAGE).snapshots().listen((response) {
      carouselMap(response);
    });
  }

  void addProducts() {
    var id = 'ffg';
    var imagePath =
        'https://firebasestorage.googleapis.com/v0/b/ecommerce-7959a.appspot.com/o/carousel%2F6.jpg?alt=media&token=afa3b31c-52d7-4207-a023-dd883a7f6625';

    addItem(
      id,
      imagePath,
    );
  }

  addItem(
    String id,
    String imagePath,
  ) {
    var item = CarouselModel(
      id: id,
      imagePath: imagePath,
    );
    firestore.collection(Urls.CAROUSEL_IMAGE).add(item.toJson());
  }

  deleteItem(String id) async {
    await firestore.collection(Urls.CAROUSEL_IMAGE).doc(id).delete();
  }
}
