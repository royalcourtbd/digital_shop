import 'package:get/get.dart';

class MainPageController extends GetxController {
  var currentIndex = 1.obs;

  void changeCurrentIndex(int index) {
    currentIndex.value = index;
    print(index);
  }
}
