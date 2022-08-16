import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:digital_shop/apps/categoryPage/controller/category_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/exchange_page_controller.dart';
import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:digital_shop/apps/profilePage/controller/profile_page_controller.dart';
import 'package:get/get.dart';

import '../apps/accountPage/controller/account_page_controller.dart';
import '../apps/mainPage/controller/main_page_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AccountPageController>(() => AccountPageController());
    Get.lazyPut<CartPageController>(() => CartPageController());
    Get.lazyPut<CategoryPageController>(() => CategoryPageController());
    Get.lazyPut<ExchangePageController>(() => ExchangePageController());
    Get.lazyPut<HomePageController>(() => HomePageController());
    Get.lazyPut<MainPageController>(() => MainPageController());
    Get.lazyPut<ProfilePageController>(() => ProfilePageController());
  }
}
