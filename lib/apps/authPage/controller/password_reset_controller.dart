import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordResetController extends GetxController {
  static PasswordResetController instance = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>(debugLabel: '_formKey');

  final controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Future passwordReset() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();

    Get.dialog(
      const AlertDialog(
        title: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: controller.text.trim());
      Get.back();

      Get.snackbar(
        'Forgot Password',
        'An email send to your registered email address',
        snackPosition: SnackPosition.BOTTOM,
      );
      controller.clear();
    } on FirebaseAuthException catch (e) {
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
