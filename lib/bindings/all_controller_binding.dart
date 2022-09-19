import 'package:digital_shop/apps/authPage/controller/auth_controller.dart';
import 'package:digital_shop/apps/authPage/controller/login_page_controller.dart';
import 'package:digital_shop/apps/authPage/controller/signup_page_controller.dart';
import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:digital_shop/apps/categoryPage/controller/category_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/buy_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/exchange_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/sell_history_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/sell_page_controller.dart';
import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:digital_shop/apps/productPage/controller/product_controller.dart';
import 'package:digital_shop/apps/profilePage/controller/profile_page_controller.dart';
import 'package:get/get.dart';

import '../apps/accountPage/controller/account_page_controller.dart';
import '../apps/mainPage/controller/main_page_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AccountPageController>(
      () => AccountPageController(),
    );
    Get.lazyPut<CartPageController>(
      () => CartPageController(),
      fenix: true,
    );
    Get.lazyPut<CategoryPageController>(
      () => CategoryPageController(),
      fenix: true,
    );
    Get.lazyPut<ExchangePageController>(
      () => ExchangePageController(),
      //fenix: true,
    );
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
      fenix: true,
    );
    Get.lazyPut<MainPageController>(
      () => MainPageController(),
      fenix: true,
    );
    Get.lazyPut<ProfilePageController>(
      () => ProfilePageController(),
      fenix: true,
    );
    Get.lazyPut<BuyPageController>(
      () => BuyPageController(),
      fenix: true,
    );

    Get.lazyPut<SellPageController>(
      () => SellPageController(),
      fenix: true,
    );
    Get.lazyPut<SellHistoryController>(
      () => SellHistoryController(),
      fenix: true,
    );
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(),
      fenix: true,
    );
    Get.lazyPut<SignUpPageController>(
      () => SignUpPageController(),
      fenix: true,
    );
    Get.lazyPut<AuthController>(
      () => AuthController(),
      fenix: true,
    );
    Get.lazyPut<ProductController>(
      () => ProductController(),
      fenix: true,
    );
  }
}
