import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPageController extends GetxController {
  static AddressPageController instance = Get.find();

  GlobalKey<FormState> addressFormKey =
      GlobalKey<FormState>(debugLabel: '_addressFormKey');
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    addressController = TextEditingController();
    numberController = TextEditingController();
    divisionController = TextEditingController();
    districtController = TextEditingController();
    zipCodeController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    numberController.dispose();
    divisionController.dispose();
    districtController.dispose();
    zipCodeController.dispose();
  }

  nameValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your Name';
    } else if (value.length <= 4) {
      return 'Name should be Minimum 5 characters';
    }
    return null;
  }

  addressValidation(String value) {
    if (value.isEmpty) {
      return 'Please Enter Your Full address';
    } else if (value.length <= 3) {
      return 'Please Enter A Valid Shipping Address';
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

  districtValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your District';
    } else if (value.length <= 2) {
      return 'Please Enter a valid District name';
    }
    return null;
  }

  void saveAddressButton() {
    final isValid = addressFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addressFormKey.currentState!.save();
  }
}
