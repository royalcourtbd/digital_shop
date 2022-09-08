import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/exchangePage/model/send_usd_model.dart';
import 'package:get/get.dart';

class SellPageController extends GetxController {
  static const sendUsdCollection = 'send_USD';

  List<SendUsdModel> usdItemsList = [];

  @override
  void onInit() {
    // TODO: implement onInit

    getUsdPriceList();
    super.onInit();
  }

  getUsdPriceList() async {
    var response =
        await FirebaseFirestore.instance.collection(sendUsdCollection).get();

    dataRecordForUsd(response);
  }

  dataRecordForUsd(QuerySnapshot<Map<String, dynamic>> response) async {
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
    usdItemsList = usdItemList.obs;
  }
}
