import 'dart:developer';

import 'package:digital_shop/apps/authPage/model/user_model.dart';
import 'package:digital_shop/general/constants/url.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../general/constants/constants.dart';
import '../../mainPage/screen/main_page_view.dart';
import '../screen/login_page_view.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> user;

  @override
  void onReady() {
    super.onReady();

    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
    //ever(user, initialScreen);
  }

  @override
  void onInit() {
    super.onInit();
    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
    getToken();
  }

  initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const LoginPageView());
      print('this function calld');
    } else {
      Get.offAll(() => MainPageView());
      print('no this function calld');
    }
  }

  void createUser(String email, password) async {
    try {
      Get.dialog(
        const AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (result) {
          String userId = result.user!.uid;

          addUserToFirestore(userId);
        },
      );

      Get.snackbar(
        'Account Creation Success',
        'Please Login To Your Account',
        snackPosition: SnackPosition.BOTTOM,
      );
      //GetStorage().write('uid', auth.currentUser!.uid);

      Get.offAllNamed(RoutesClass.getLoginPageRoute());
    } on FirebaseAuthException catch (e) {
      log(e.code);
      Get.back();
      Get.snackbar(
        'Account Creation Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signIn(String email, password) async {
    try {
      Get.dialog(
        const AlertDialog(
          title: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
      await auth.signInWithEmailAndPassword(email: email, password: password);

      Get.offAllNamed(
        RoutesClass.getMainRoute(),
      );
      storage.write('uid', auth.currentUser!.uid);
    } catch (e) {
      Get.back();
      Get.snackbar(
        'Login Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(
        email: email,
      );
      Get.dialog(
        const AlertDialog(
          content: Text('email sent'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Can\'t reset',
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    await auth.signOut();
    Get.offAllNamed(RoutesClass.getLoginPageRoute());
    storage.remove('uid');
  }

  void getToken() async {
    await messaging.getToken().then((token) {
      if (authController.user.value != null) {
        log('device Tocken update success');
        firestore
            .collection(Urls.USER_COLLECTION)
            .doc(auth.currentUser!.uid)
            .update({
          'deviceToken': token!,
        });
      }
      storage.write('deviceToken', token!);
      log(storage.read('deviceToken'));
    });
  }

  addUserToFirestore(String userId) {
    var userModel = UserModel(
      accountBalance: 0,
      email: signUpPageController.emailController.text,
      name: signUpPageController.nameController.text,
      userId: userId,
      image: '',
      createdAt:
          '${DateFormat('dd/MMM/yyyy').format(DateTime.now())} at ${DateFormat('hh:mm a').format(DateTime.now())}',
      deviceToken: storage.read('deviceToken'),
    );
    firestore
        .collection(Urls.USER_COLLECTION)
        .doc(userId)
        .set(userModel.toJson());
  }
}
