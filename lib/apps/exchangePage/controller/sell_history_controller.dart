import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:digital_shop/general/constants/url.dart';
import 'package:get/get.dart';

import '../model/sell_order_model.dart';

class SellHistoryController extends GetxController {
  static SellHistoryController instance = Get.find();
  //static const ORDER_COLLECTION = 'order';
  RxList sellOrderHistoryList = [].obs;

  @override
  onInit() {
    getSellOrderHistory();
    dataSnapshotForSellOrderHistory();
    super.onInit();
  }

  getSellOrderHistory() async {
    var response = await firestore.collection(Urls.ORDER_COLLECTION).get();
    dataRecordMapForSellOrderHistory(response);
  }

  dataRecordMapForSellOrderHistory(
      QuerySnapshot<Map<String, dynamic>> response) {
    var list = response.docs
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

    sellOrderHistoryList.value = list;
    sellOrderHistoryList.refresh();
  }

  dataSnapshotForSellOrderHistory() {
    firestore.collection(Urls.ORDER_COLLECTION).snapshots().listen((response) {
      dataRecordMapForSellOrderHistory(response);
    });
  }
}
