import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/sell_order_model.dart';

class SellHistoryController extends GetxController {
  static const ORDER_COLLECTION = 'order';
  RxList sellOrderHistoryList = [].obs;

  @override
  onInit() {
    getSellOrderHistory();
    dataSnapshotForSellOrderHistory();
    super.onInit();
  }

  getSellOrderHistory() async {
    var response =
        await FirebaseFirestore.instance.collection(ORDER_COLLECTION).get();
    dataRecordMapForSellOrderHistory(response);
    refresh();
    print(response.docs);
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
    FirebaseFirestore.instance
        .collection(ORDER_COLLECTION)
        .snapshots()
        .listen((response) {
      dataRecordMapForSellOrderHistory(response);
    });
  }
}
