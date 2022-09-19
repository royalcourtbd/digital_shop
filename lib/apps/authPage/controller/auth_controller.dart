import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../mainPage/screen/main_page_view.dart';
import '../screen/login_page_view.dart';

class AuthController extends GetxController {
  late Rx<User?> user;
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  GetStorage storage = GetStorage();

  @override
  void onReady() {
    super.onReady();

    user = Rx<User?>(auth.currentUser);
    user.bindStream(auth.userChanges());
    // ever(user, initialScreen);
  }

  initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPageView());
      print('this function calld');
    } else {
      Get.offAll(() => MainPageView());
      print('no this function calld');
    }
  }

  void createUser(String email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          )
          .then(
            (value) => {
              firebase.collection('user').doc(value.user!.uid).set(
                {
                  "email": value.user!.email,
                  "id": value.user!.uid,
                  "password": password,
                },
              )
            },
          );
      Get.snackbar(
        'Account Creation Success',
        'Please Login To Your Account',
        snackPosition: SnackPosition.BOTTOM,
      );
      //GetStorage().write('uid', auth.currentUser!.uid);

      Get.offAll(() => LoginPageView());
    } catch (e) {
      Get.snackbar(
        'Account Creation Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signIn(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);

      Get.offAll(() => MainPageView());
      storage.write('uid', auth.currentUser!.uid);
    } catch (e) {
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
        'Login Failed',
        e.message.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    await auth.signOut();
    Get.offAll(() => LoginPageView());
    storage.remove('uid');
  }
}
