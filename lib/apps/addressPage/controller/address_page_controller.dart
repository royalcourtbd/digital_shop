import 'package:digital_shop/apps/addressPage/model/address_model.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:digital_shop/general/constants/url.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPageController extends GetxController {
  static AddressPageController instance = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  // var selectLabel = false.obs;
  final selectLabel = RxString('');

  GlobalKey<FormState> addressFormKey =
      GlobalKey<FormState>(debugLabel: '_addressFormKey');
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController divisionController = TextEditingController();
  TextEditingController thanaController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    addressController = TextEditingController();
    numberController = TextEditingController();
    divisionController = TextEditingController();
    thanaController = TextEditingController();
    zipCodeController = TextEditingController();
    addressList.bindStream(addressItem());
  }

  @override
  void onReady() {
    super.onReady();
    addressList.bindStream(addressItem());
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    addressController.dispose();
    numberController.dispose();
    divisionController.dispose();
    thanaController.dispose();
    zipCodeController.dispose();
  }

  clearController() {
    Future.delayed(const Duration(seconds: 1));
    nameController.clear();
    addressController.clear();
    numberController.clear();
    divisionController.clear();
    thanaController.clear();
    zipCodeController.clear();
  }

  RxList addressList = [].obs;

  int get addressLength => addressList.length;

  Stream<List<AddressModel>> addressItem() => firestore
      .collection(Urls.USER_COLLECTION)
      .doc(auth.currentUser!.uid)
      .collection(Urls.ADDRESS_COLLECTION)
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map(
        (query) => query.docs.map(
          (item) {
            return AddressModel(
              docId: item.id,
              userId: item["userId"],
              addressId: item["addressId"],
              name: item["name"],
              number: item["number"],
              address: item["address"],
              division: item["division"],
              thana: item["thana"],
              zip: item["zip"],
              label: item["label"],
              createdAt: item["createdAt"],
            );
          },
        ).toList(),
      );

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

  thanaValidation(value) {
    if (value.isEmpty) {
      return 'Please Enter Your thana';
    } else if (value.length <= 2) {
      return 'Please Enter a valid thana name';
    }
    return null;
  }

  void saveAddressButton() {
    final isValid = addressFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    addressFormKey.currentState!.save();
    Future.delayed(
      const Duration(seconds: 1),
    );
    addAddress();
  }

  addAddress() {
    try {
      //
      addAddressItem(
        auth.currentUser!.uid,
        'DS${UniqueKey().toString().replaceAll('[#', '').replaceAll(']', '')}',
        nameController.text.trim(),
        numberController.text.trim(),
        addressController.text.trim(),
        divisionController.text.trim(),
        thanaController.text.trim(),
        zipCodeController.text.trim(),
        selectLabel.value,
        DateTime.now().toString(),
      );

      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: const Text(
            'Shipping Address  Successfully added ',
          ),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.green.shade100,
        ),
      );
      clearController();
      Get.offAndToNamed(RoutesClass.getAddressPageRoute());
    } catch (e) {
      //
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text("cannot add address"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  addAddressItem(
    String userId,
    String addressId,
    String name,
    String number,
    String address,
    String division,
    String thana,
    String zip,
    String label,
    String createdAt,
  ) async {
    final id = firestore
        .collection(Urls.USER_COLLECTION)
        .doc(auth.currentUser!.uid)
        .collection(Urls.ADDRESS_COLLECTION)
        .doc()
        .id;
    final docRef = firestore
        .collection(Urls.USER_COLLECTION)
        .doc(auth.currentUser!.uid)
        .collection(Urls.ADDRESS_COLLECTION)
        .doc(id);

    var add = AddressModel(
      docId: id,
      userId: userId,
      addressId: addressId,
      name: name,
      number: number,
      address: address,
      division: division,
      thana: thana,
      zip: zip,
      label: label,
      createdAt: createdAt,
    );
    // await firestore
    //     .collection(Urls.USER_COLLECTION)
    //     .doc(auth.currentUser!.uid)
    //     .collection(Urls.ADDRESS_COLLECTION)
    //     .add(add.toJson());

    await docRef.set(add.toJson());
  }
}
