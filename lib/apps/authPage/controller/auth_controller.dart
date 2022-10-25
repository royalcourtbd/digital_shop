import 'package:digital_shop/general/constants/url.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../general/constants/constants.dart';
import '../../mainPage/screen/main_page_view.dart';
import '../screen/login_page_view.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> user;

  GetStorage storage = GetStorage();

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
    } catch (e) {
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

  addUserToFirestore(String userId) {
    firestore.collection(Urls.USER_COLLECTION).doc(userId).set(
      {
        "accountBalance": 0,
        "name": signUpPageController.nameController.text.trim(),
        "email": signUpPageController.emailController.text.trim(),
        "number": signUpPageController.numberController.text.trim(),
        "userId": userId,
        "password": signUpPageController.passwordController.text.trim(),
      },
    );
  }
}
