import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../exchangePage/model/received_usd_model.dart';

class AccountPageController extends GetxController {
  static const receivedUsdCollection = 'received_USD';
  RxList buyItemUSDList = [].obs;

  @override
  onInit() {
    getUsdPriceList();
    dataSnapshotsForUSD();
    super.onInit();
  }

  getUsdPriceList() async {
    var response = await FirebaseFirestore.instance
        .collection(receivedUsdCollection)
        .get();
    dataRecordsMapForUSD(response);
    refresh();
    print(response.docs);
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

    buyItemUSDList.value = list;
    buyItemUSDList.refresh();
    print(buyItemUSDList[0]);
  }

  dataSnapshotsForUSD() {
    FirebaseFirestore.instance
        .collection(receivedUsdCollection)
        .snapshots()
        .listen((response) {
      dataRecordsMapForUSD(response);
    });
  }
}
