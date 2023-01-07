import 'package:digital_shop/general/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class PasswordResetController extends GetxController {
  static PasswordResetController instance = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: '_formKey');

  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  Future passwordReset() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    EasyLoading.show();

    try {
      await auth.sendPasswordResetEmail(email: passwordController.text.trim());
      Get.back();

      Get.snackbar(
        'Forgot Password',
        'An email send to your registered email address',
        snackPosition: SnackPosition.BOTTOM,
      );
      EasyLoading.dismiss();
      passwordController.clear();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Input a Valid Email';
    }
    return null;
  }
}
