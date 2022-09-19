import 'package:get/get.dart';

class MainPageController extends GetxController {
  var currentIndex = 2.obs;
  var currentPage = 1.obs;

  void changeCurrentIndex(int index) {
    currentIndex.value = index;
  }

  // void changeCurrentPage(int index) {
  //   currentPage.value = index;
  // }
}
