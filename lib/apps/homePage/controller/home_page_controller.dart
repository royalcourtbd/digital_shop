import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/homePage/model/carousel_model.dart';
import 'package:digital_shop/apps/widgets/use_for_back_button.dart';
import 'package:digital_shop/general/constants/url.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../general/constants/constants.dart';

class HomePageController extends GetxController {
  static HomePageController instance = Get.find();
  RxList carouselSliderList = [].obs;

  List icon = [
    Icons.announcement_outlined,
    Icons.favorite_border,
    Icons.dashboard_outlined,
    Icons.assignment_outlined,
  ];
  late FToast fToast;
  //GlobalKey<CarouselSliderState> sliderKey = GlobalKey();

  @override
  onInit() {
    getCarouselImage();
    carouselSnapshot();
    fToast = FToast();
    fToast.init(Get.context!);

    super.onInit();
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      log('I am the token$token');
    });
  }

  showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("This is a Custom Toast"),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    // Custom Toast Position
    fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 2),
      positionedToastBuilder: (context, child) {
        return Positioned(
          top: 16.0,
          left: 16.0,
          child: child,
        );
      },
    );
  }

  Future<bool> exitButton() async {
    return UseForBackButton.backButton();
  }

  getCarouselImage() async {
    var response = await firestore.collection(Urls.CAROUSEL_IMAGE).get();
    carouselMap(response);
  }

  carouselMap(QuerySnapshot<Map<String, dynamic>> response) async {
    var imageList = response.docs
        .map(
          (e) => CarouselImageModel.fromJson(e.data()),
        )
        .toList();
    carouselSliderList.value = imageList;
  }

  carouselSnapshot() {
    firestore.collection(Urls.CAROUSEL_IMAGE).snapshots().listen((response) {
      carouselMap(response);
    });
  }
}
