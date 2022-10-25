import 'package:digital_shop/apps/authPage/model/user_model.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:digital_shop/general/constants/url.dart';
import 'package:get/get.dart';

import '../../exchangePage/model/received_usd_model.dart';

class AccountPageController extends GetxController {
  static AccountPageController instance = Get.find();

  RxList buyItemUSDList = [].obs;

  @override
  void onReady() {
    super.onReady();
    buyItemUSDList.bindStream(getUsdPriceList());
  }

  Stream<List<ReceivedUsdModel>> getUsdPriceList() =>
      firestore.collection(Urls.receivedUsdCollection).snapshots().map(
            (query) => query.docs
                .map(
                  (item) => ReceivedUsdModel.fromJson(
                    item.data(),
                  ),
                )
                .toList(),
          );

  plaorder() {
    var order = UserModel(
      accountBalance: 5,
      email: 'fjkhfowe',
      name: 'gjreigj',
      userId: auth.currentUser!.uid,
    );
    firestore
        .collection(Urls.USER_COLLECTION)
        .doc(auth.currentUser!.uid)
        .collection('order')
        .add(order.toJson());
  }
}
