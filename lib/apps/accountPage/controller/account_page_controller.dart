import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/authPage/model/user_model.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:digital_shop/general/constants/url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

UserModel? userModel;

class AccountPageController extends GetxController {
  static AccountPageController instance = Get.find();
  RxBool isShimmerActive = true.obs;

  List iconList = [
    IconlyBold.document,
    IconlyBold.profile,
    IconlyBold.location,
    IconlyBold.message,
  ];
  List iconName = [
    'Orders',
    'Profile',
    'Address',
    'Message',
  ];
  List iconBgColor = [
    const Color.fromARGB(255, 101, 234, 106),
    const Color.fromARGB(255, 220, 149, 144),
    const Color.fromARGB(255, 177, 171, 112),
    const Color.fromARGB(255, 128, 171, 239),
  ];

  Rx<UserModel?> profile = UserModel().obs;

  @override
  void onReady() {
    authController.user.value != null
        ? getUserFromDB(auth.currentUser!.uid)
        : null;
    super.onReady();
  }

  @override
  void onInit() {
    authController.user.value != null
        ? getUserFromDB(auth.currentUser!.uid)
        : null;
    super.onInit();
  }

//fetch Account Data to firebase firestore

  Future getUserFromDB(String uid) async {
    try {
      var userData =
          await firestore.collection(Urls.USER_COLLECTION).doc(uid).get();

      userModel = UserModel.fromJson(userData.data()!);

      log(userModel!.userId!);
      profile.value = userModel;

      return userModel!;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  //

  plaorder() {
    var order = UserModel(
      accountBalance: 5,
      email: auth.currentUser!.email,
      name: auth.currentUser!.uid,
      userId: auth.currentUser!.uid,
    );
    firestore
        .collection(Urls.USER_COLLECTION)
        .doc(auth.currentUser!.uid)
        .collection('order')
        .add(order.toJson());
  }
}
