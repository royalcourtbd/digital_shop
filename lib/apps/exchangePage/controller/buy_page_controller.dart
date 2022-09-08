import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/exchangePage/model/received_usd_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/bdt_product_model.dart';

class BuyPageController extends GetxController {
  static const receivedUsdCollection = 'received_USD';
  static const bdtCollection = 'send_BDT';

  List<ReceivedUsdModel> itemList = [];
  List<BdtProductsModel> bdProductsList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getUsdPriceList();
    getBDTProductsList();
    myFocusNode = FocusNode();
    super.onInit();
  }

  getBDTProductsList() async {
    var response =
        await FirebaseFirestore.instance.collection(bdtCollection).get();
    dataRecordsForBDT(response);
  }

  dataRecordsForBDT(QuerySnapshot<Map<String, dynamic>> response) {
    var bdtList = response.docs
        .map(
          (e) => BdtProductsModel(
            id: e.id,
            bdBankName: e['bdBankName'],
            bdBankIcon: e['bdBankIcon'],
          ),
        )
        .toList();
    bdProductsList = bdtList.obs;
  }

  getUsdPriceList() async {
    var response = await FirebaseFirestore.instance
        .collection(receivedUsdCollection)
        .get();
    dataRecords(response);
  }

  dataRecords(QuerySnapshot<Map<String, dynamic>> response) {
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

    itemList = list.obs;
    print(itemList);
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

  @override
  void dispose() {
    // TODO: implement dispose
    myFocusNode.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController sendAmountController = TextEditingController();
  TextEditingController sendNumberController = TextEditingController();
  TextEditingController sendTrxIdController = TextEditingController();
  TextEditingController sendEmailController = TextEditingController();
  TextEditingController sendNoteController = TextEditingController();
  //TextEditingController receiveAmountController = TextEditingController();

  RxBool isBkash = true.obs;

  void visibility() {
    isBkash.value = !isBkash.value;
  }
}
