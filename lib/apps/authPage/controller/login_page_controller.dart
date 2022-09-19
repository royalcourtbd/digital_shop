import 'package:digital_shop/apps/authPage/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthController authController = Get.put(AuthController());

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  emailValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Email';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please Enter A Valid Email Address';
    }
    return null;
  }

  passwordValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your Password';
    } else if (value.length <= 7) {
      return 'password should be 8 characters';
    }
    return null;
  }

  void logInButton() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    authController.signIn(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    const CircularNotchedRectangle();
  }
}
