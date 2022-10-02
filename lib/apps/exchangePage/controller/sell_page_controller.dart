import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/exchangePage/model/bdt_product_model.dart';
import 'package:digital_shop/apps/exchangePage/model/send_usd_model.dart';
import 'package:digital_shop/apps/mainPage/controller/main_page_controller.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../model/sell_order_model.dart';

class SellPageController extends GetxController {
  static const sendUsdCollection = 'send_USD';
  static const bdtCollection = 'send_BDT';
  static const ORDER_COLLECTION = 'order';
  final count = 0.obs;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final mainPageController = Get.put(MainPageController());

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
    // TODO: implement onInit
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
    // TODO: implement dispose
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

  void sellSubmitButton() {
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
    var contactNumber = sendContactNumberController.text.trim();
    var email = sendEmailController.text.trim();
    var note = sendNoteController.text.trim();
    receiveAmount.value.toString();
    var receiveMethod = titleBdt.value;
    var sendMethod = titleUsd.value;
    var sendNumber = sendNumberController.text.trim();
    var sendAmount = sendAmountController.text.trim();

    var time =
        '${DateFormat('dd/MMM/yyyy').format(DateTime.now())} at ${DateFormat('hh:mm a').format(DateTime.now())}';

    addItem(
      contactNumber,
      email,
      note,
      receiveAmount,
      receiveMethod,
      sendMethod,
      sendNumber,
      sendAmount,
      time,
    );
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
    var response = await firebaseFirestore.collection(ORDER_COLLECTION).get();
    dataRecordMapForSellOrder(response);
  }

  dataRecordMapForSellOrder(
      QuerySnapshot<Map<String, dynamic>> response) async {
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
    FirebaseFirestore.instance
        .collection(ORDER_COLLECTION)
        .snapshots()
        .listen((response) {
      dataRecordMapForSellOrder(response);
    });
  }

  getUsdSellPriceList() async {
    var response = await firebaseFirestore.collection(sendUsdCollection).get();

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
    firebaseFirestore
        .collection(sendUsdCollection)
        .snapshots()
        .listen((response) {
      dataRecordsMapForUSD(response);
    });
  }

  getBDTSellPriceList() async {
    var response = await firebaseFirestore.collection(bdtCollection).get();

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
    firebaseFirestore.collection(bdtCollection).snapshots().listen((response) {
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
    firebaseFirestore.collection(ORDER_COLLECTION).add(item.toJson());
  }
}
