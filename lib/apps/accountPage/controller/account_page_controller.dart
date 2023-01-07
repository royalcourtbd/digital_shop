import 'dart:developer';
import 'dart:io';

import 'package:digital_shop/apps/authPage/model/user_model.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:digital_shop/general/constants/url.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';

class AccountPageController extends GetxController {
  static AccountPageController instance = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
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
  void onInit() {
    getUserInfo();
    super.onInit();
  }

//fetch Account Data to firebase firestore

  getUserInfo() async {
    String uid = auth.currentUser!.uid;

    try {
      firestore
          .collection(Urls.USER_COLLECTION)
          .doc(uid)
          .snapshots()
          .listen((event) {
        profile.value = UserModel.fromJson(event.data()!);
      });
    } catch (error) {
      throw Exception(error);
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

  final isUploading = RxBool(false);

  final profileImage = RxString('');

  final ImageSource _imageSource = ImageSource.gallery;

  Future<String> updateImage(XFile xFile) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();

    final photoRef =
        FirebaseStorage.instance.ref().child('Profile Image/$imageName');
    final uploadTask = photoRef.putFile(File(xFile.path));
    final snapshot = await uploadTask.whenComplete(() => null);

    return snapshot.ref.getDownloadURL();
  }

  void addProfileImage(String uid) async {
    final selectedImage = await ImagePicker().pickImage(source: _imageSource);
    if (selectedImage != null) {
      isUploading.value = true;

      try {
        final url = await updateImage(selectedImage);

        profileImage.value = url;
        await firestore.collection(Urls.USER_COLLECTION).doc(uid).update(
          {
            'image': url,
          },
        );
        log(url);
        isUploading.value = false;
      } catch (e) {
        //
      } finally {}
    }
  }
}
