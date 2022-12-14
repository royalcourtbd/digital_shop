import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/exchangePage/model/bdt_product_model.dart';
import 'package:digital_shop/apps/exchangePage/model/send_usd_model.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/sell_order_model.dart';

class SellPageController extends GetxController {
  static SellPageController instance = Get.find();
  static const sendUsdCollection = 'send_USD';
  static const bdtCollection = 'send_BDT';
  static const ORDER_COLLECTION = 'order';
  final count = 0.obs;

  List<SendUsdModel> sellUsdItem = [];
  List<BdtProductsModel> sellBDTItem = [];
  List<SellOrderModel> sell_order_model_list = [];
  late FocusNode myFocusNode;

  final formKey = GlobalKey<FormState>();
  TextEditingController sendAmountController = TextEditingController();
  TextEditingController sendNumberController = TextEditingController();
  TextEditingController sendEmailController = TextEditingController();
  TextEditingController sendContactNumberController = TextEditingController();
  TextEditingController sendNoteController = TextEditingController();
  var paymentNotice =
      'নিচের BKash নাম্বারে টাকা পাঠানোর পর Submit Button-এ ক্লিক করুন ।\nCash Out From : 01749247855   (Agent Number)'
          .obs;

  @override
  void onInit() {
    super.onInit();
    sendAmountController = TextEditingController();
    sendNumberController = TextEditingController();
    sendEmailController = TextEditingController();
    sendContactNumberController = TextEditingController();
    sendNoteController = TextEditingController();

    myFocusNode = FocusNode();
    getUsdSellPriceList();
    getBDTSellPriceList();
    getSellOrder();
    dataSnapshotsForSellOrder();
    dataSnapshotsForUSD();
    dataSnapshotsForBDT();
  }

  @override
  void dispose() {
    myFocusNode.dispose();
    sendAmountController.dispose();
    sendNumberController.dispose();
    sendEmailController.dispose();
    sendContactNumberController.dispose();
    sendNoteController.dispose();
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

  validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return 'Input a Valid Email';
    }
    return null;
  }

  validateContactNumber(String value) {
    if (value.isEmpty) {
      return 'This field can\'t be empty';
    }
    if (value.length < 11) {
      return 'number at least 11 digits';
    }
    return null;
  }

  void sellSubmitButton() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    addItem(
      sendContactNumberController.text.trim(),
      sendEmailController.text.trim(),
      sendNoteController.text.trim(),
      receiveAmount.value.toString(),
      titleBdt.value,
      titleUsd.value,
      sendNumberController.text.trim(),
      sendAmountController.text.trim(),
      '${DateFormat('dd/MMM/yyyy').format(DateTime.now())} at ${DateFormat('hh:mm a').format(DateTime.now())}',
    );
    Get.dialog(
      const AlertDialog(
        title: SizedBox(
          height: 50,
          width: 40,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
    await Future.delayed(const Duration(seconds: 2));

    Get.back();
    Get.snackbar(
      'Succes',
      'please wite for verification and delivery',
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.toNamed(RoutesClass.getSellHistoryPageRoute());
    sendAmountController.clear();
    sendNumberController.clear();
    sendEmailController.clear();
    sendContactNumberController.clear();
    sendNoteController.clear();
  }

  void cancelButton() {
    sendAmountController.clear();
    sendEmailController.clear();
    sendNoteController.clear();
    sendContactNumberController.clear();
    sendNumberController.clear();
  }

  getSellOrder() async {
    var response = await firestore.collection(ORDER_COLLECTION).get();
    dataRecordMapForSellOrder(response);
  }

  dataRecordMapForSellOrder(
    QuerySnapshot<Map<String, dynamic>> response,
  ) async {
    var sellList = response.docs
        .map(
          (e) => SellOrderModel(
            contactNumber: e['contactNumber'],
            email: e['email'],
            note: e['note'],
            receiveAmount: e['receiveAmount'],
            receiveMethod: e['receiveMethod'],
            sendMethod: e['sendMethod'],
            sendNumber: e['sendNumber'],
            sendAmount: e['sendAmount'],
            dateTime: e['dateTime'],
          ),
        )
        .toList();

    sell_order_model_list = sellList.obs;
  }

  dataSnapshotsForSellOrder() {
    firestore.collection(ORDER_COLLECTION).snapshots().listen((response) {
      dataRecordMapForSellOrder(response);
    });
  }

  getUsdSellPriceList() async {
    var response = await firestore.collection(sendUsdCollection).get();

    dataRecordsMapForUSD(response);
  }

  dataRecordsMapForUSD(QuerySnapshot<Map<String, dynamic>> response) async {
    var usdItemList = response.docs
        .map(
          (item) => SendUsdModel(
            id: item.id,
            dollarName: item['dollarName'],
            dollarIcon: item['dollarIcon'],
            currentPrice: item['currentPrice'],
          ),
        )
        .toList();
    sellUsdItem = usdItemList.obs;
  }

  dataSnapshotsForUSD() {
    firestore.collection(sendUsdCollection).snapshots().listen((response) {
      dataRecordsMapForUSD(response);
    });
  }

  getBDTSellPriceList() async {
    var response = await firestore.collection(bdtCollection).get();

    dataRecordsMapForBDT(response);
  }

  dataRecordsMapForBDT(QuerySnapshot<Map<String, dynamic>> response) async {
    var bdtItemList = response.docs
        .map(
          (e) => BdtProductsModel(
            id: e.id,
            bdBankName: e['bdBankName'],
            bdBankIcon: e['bdBankIcon'],
            baBankAccountNumber: e['baBankAccountNumber'],
          ),
        )
        .toList();

    sellBDTItem = bdtItemList.obs;
  }

  dataSnapshotsForBDT() {
    firestore.collection(bdtCollection).snapshots().listen((response) {
      dataRecordsMapForBDT(response);
    });
  }

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

  addItem(
    String contactNumber,
    email,
    note,
    receiveAmount,
    receiveMethod,
    sendMethod,
    sendNumber,
    sendAmount,
    dateTime,
  ) {
    var item = SellOrderModel(
      contactNumber: contactNumber,
      email: email,
      note: note,
      receiveAmount: receiveAmount.toString(),
      receiveMethod: receiveMethod,
      sendMethod: sendMethod,
      sendNumber: sendNumber,
      sendAmount: sendAmount,
      dateTime: dateTime,
    );
    firestore.collection(ORDER_COLLECTION).add(item.toJson());
  }
}
