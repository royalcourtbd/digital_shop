import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/exchangePage/model/exchange_history_model.dart';
import 'package:digital_shop/apps/exchangePage/model/received_usd_model.dart';
import 'package:digital_shop/apps/exchangePage/model/send_usd_model.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constants/url.dart';
import '../model/bdt_product_model.dart';

class BuyPageController extends GetxController {
  static BuyPageController instance = Get.find();
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

  void buySubmit(BdtProductsModel bdtProductsModel, SendUsdModel sendUsdModel) {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    buyDollar(
      sendNumberController.text,
      DateTime.now().toString(),
      receiveAmount.value.toString(),
      titleBdt.value,
      imageBdt.value,
      sendAmountController.text,
      titleUsd.value,
      imageUsd.value,
      false,
    );
  }

  void cancelButton() {
    sendAmountController.clear();
    sendEmailController.clear();
    sendNoteController.clear();
    sendTrxIdController.clear();
    sendNumberController.clear();
  }

//fetch Category from Firebase
  Stream<List<ReceivedUsdModel>> usdItemList() =>
      firestore.collection(Urls.CATEGORY_COLLECTION).snapshots().map(
            (query) => query.docs
                .map(
                  (item) => ReceivedUsdModel.fromJson(
                    item.data(),
                  ),
                )
                .toList(),
          );

  //

  Future getBDTProductsList() async {
    var response = await firestore.collection(bdtCollection).get();
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
    firestore.collection(bdtCollection).snapshots().listen((response) {
      dataRecordsMapForBDT(response);
    });
  }

  getUsdPriceList() async {
    var response = await firestore.collection(receivedUsdCollection).get();
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
    firestore.collection(receivedUsdCollection).snapshots().listen((response) {
      dataRecordsMapForUSD(response);
    });
  }

  //
  var paymentNotice =
      'নিচের BKash নাম্বারে টাকা পাঠানোর পর Submit Button-এ ক্লিক করুন ।\nPayment To : 01642294321   (Merchant Number)'
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

  buyDollar(
      String contactNumber,
      String createdAt,
      String receivedAmount,
      String receivedMethod,
      String receivedMethodIcon,
      String sendAmount,
      String sendMethod,
      String sendMethodIcon,
      bool status,
      {String? trxId}) async {
    final id = firestore.collection(Urls.EXCHANGE_HISTORY).doc().id;
    final docRef = firestore.collection(Urls.EXCHANGE_HISTORY).doc(id);
    final toExchange = ExchangeHistoryModel(
      docId: id,
      contactNumber: contactNumber,
      createdAt: createdAt,
      receivedAmount: receivedAmount,
      receivedMethod: receivedMethod,
      receivedMethodIcon: receivedMethodIcon,
      sendAmount: sendAmount,
      sendMethod: sendMethod,
      sendMethodIcon: sendMethodIcon,
      status: status,
      trxId: trxId,
    );

    await docRef.set(toExchange.toJson());
  }
}
