import 'package:get/get.dart';

import '../apps/mainPage/controller/main_screen_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<MainScreenController>(() => MainScreenController());
  }
}
