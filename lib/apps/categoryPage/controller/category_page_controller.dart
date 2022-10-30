import 'package:digital_shop/apps/categoryPage/model/category_model.dart';
import 'package:get/get.dart';

import '../../../general/constants/constants.dart';
import '../../../general/constants/url.dart';

class CategoryPageController extends GetxController {
  static CategoryPageController instance = Get.find();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    categoryList.bindStream(categoryItemList());
  }

  @override
  void onInit() {
    super.onInit();
    categoryList.bindStream(categoryItemList());
  }

  RxList categoryList = [].obs;

  int get categoryLength => categoryList.length;

  Stream<List<CategoryModel>> categoryItemList() =>
      firestore.collection(Urls.CATEGORY_COLLECTION).snapshots().map(
            (query) => query.docs
                .map(
                  (item) => CategoryModel.fromJson(
                    item.data(),
                  ),
                )
                .toList(),
          );
}
