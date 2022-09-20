import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/exchangePage/model/received_usd_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/bdt_product_model.dart';

class BuyPageController extends GetxController {
  static const receivedUsdCollection = 'received_USD';
  static const bdtCollection = 'send_BDT';

  List<ReceivedUsdModel> buyItemUSDList = [];
  List<BdtProductsModel> bdProductsList = [];

  final formKey = GlobalKey<FormState>();
  TextEditingController sendAmountController = TextEditingController();
  TextEditingController sendNumberController = TextEditingController();
  TextEditingController sendTrxIdController = TextEditingController();
  TextEditingController sendEmailController = TextEditingController();
  TextEditingController sendNoteController = TextEditingController();
  //TextEditingController receiveAmountController = TextEditingController();

  @override
  void onInit() {
    sendAmountController = TextEditingController();
    sendNumberController = TextEditingController();
    sendTrxIdController = TextEditingController();
    sendEmailController = TextEditingController();
    sendNoteController = TextEditingController();

    getUsdPriceList();
    getBDTProductsList();
    dataSnapshotsForUSD();
    dataSnapshotsForBDT();
    myFocusNode = FocusNode();
    super.onInit();
  }

  @override
  void dispose() {
    sendAmountController.dispose();
    sendNumberController.dispose();
    sendTrxIdController.dispose();
    sendEmailController.dispose();
    sendNoteController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  validateAmount(String value) {
    if (value.isEmpty) {
      return 'Input a Amount';
    }
    return null;
  }

  validateSendAmountNumber(String value) {
    if (value.isEmpty) {
      return 'This field can\'t be empty';
    }
    if (value.length < 11) {
      return 'number at least 11 digits';
    }
    return null;
  }

  validateTrxID(String value) {
    if (value.isEmpty) {
      return 'This field can\'t be empty';
    }

    return null;
  }

  validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Input a Valid Email';
    }
    return null;
  }

  void buySubmit() {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
  }

  void cancelButton() {
    sendAmountController.clear();
    sendEmailController.clear();
    sendNoteController.clear();
    sendTrxIdController.clear();
    sendNumberController.clear();
  }

  Future getBDTProductsList() async {
    var response =
        await FirebaseFirestore.instance.collection(bdtCollection).get();
    dataRecordsMapForBDT(response);
  }

  dataRecordsMapForBDT(QuerySnapshot<Map<String, dynamic>> response) {
    var bdtList = response.docs
        .map(
          (e) => BdtProductsModel(
            id: e.id,
            bdBankName: e['bdBankName'],
            bdBankIcon: e['bdBankIcon'],
            baBankAccountNumber: e['baBankAccountNumber'],
          ),
        )
        .toList();
    bdProductsList = bdtList.obs;
  }

  dataSnapshotsForBDT() {
    FirebaseFirestore.instance
        .collection(bdtCollection)
        .snapshots()
        .listen((response) {
      dataRecordsMapForBDT(response);
    });
  }

  getUsdPriceList() async {
    var response = await FirebaseFirestore.instance
        .collection(receivedUsdCollection)
        .get();
    dataRecordsMapForUSD(response);
  }

  dataRecordsMapForUSD(QuerySnapshot<Map<String, dynamic>> response) {
    var list = response.docs
        .map(
          (e) => ReceivedUsdModel(
            id: e.id,
            dollarName: e['dollarName'],
            dollarIcon: e['dollarIcon'],
            currentPrice: e['currentPrice'],
          ),
        )
        .toList();

    buyItemUSDList = list.obs;
  }

  dataSnapshotsForUSD() {
    FirebaseFirestore.instance
        .collection(receivedUsdCollection)
        .snapshots()
        .listen((response) {
      dataRecordsMapForUSD(response);
    });
  }

  //
  var paymentNotice =
      'নিচের BKash নাম্বারে টাকা পাঠানোর পর Submit Button-এ ক্লিক করুন ।\nCash Out From : 01749247855   (Agent Number)'
          .obs;
  final scrollController = ScrollController();
  RxString imageBdt = 'assets/currency/bank.png'.obs;
  RxString imageUsd = 'assets/currency/bank.png'.obs;
  RxString titleBdt = 'Please select a item'.obs;
  RxString titleUsd = 'Please select a item'.obs;

  RxInt indexBdt = 0.obs;
  RxInt indexUsd = 0.obs;

  //
  RxDouble receiveAmount = 0.0.obs;
  RxDouble valueTest = 0.0.obs;
  RxDouble calculatAmount = 0.0.obs;

  add(double one, double two) {
    receiveAmount.value = one * two;
    return receiveAmount.value;
  }

  late FocusNode myFocusNode;

  RxBool isBkash = true.obs;

  void visibility() {
    isBkash.value = !isBkash.value;
  }
}
