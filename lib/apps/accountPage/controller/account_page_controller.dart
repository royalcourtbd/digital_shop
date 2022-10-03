import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/general/constants/url.dart';
import 'package:get/get.dart';

import '../../exchangePage/model/received_usd_model.dart';

class AccountPageController extends GetxController {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  RxList buyItemUSDList = [].obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    buyItemUSDList.bindStream(getUsdPriceList());
  }

  Stream<List<ReceivedUsdModel>> getUsdPriceList() =>
      fireStore.collection(Urls.receivedUsdCollection).snapshots().map(
            (query) => query.docs
                .map(
                  (item) => ReceivedUsdModel.fromJson(
                    item.data(),
                  ),
                )
                .toList(),
          );
}
