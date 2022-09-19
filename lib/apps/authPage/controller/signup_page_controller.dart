import 'package:digital_shop/apps/authPage/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController {
  final registerFormKey = GlobalKey<FormState>();
  final AuthController authController = Get.put(AuthController());
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    numberController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    numberController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  nameValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your Name';
    } else if (value.length <= 4) {
      return 'Name should be Minimum 5 characters';
    }
    return null;
  }

  emailValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Email';
    } else if (!GetUtils.isEmail(value)) {
      return 'Please Enter A Valid Email Address';
    }
    return null;
  }

  numberValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your Mobile Number';
    } else if (value.length <= 10) {
      return 'Number should be Minimum 11 characters';
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

  void signUpButton() {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    registerFormKey.currentState!.save();
    authController.createUser(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }
}
