import 'package:digital_shop/apps/addressPage/controller/address_page_controller.dart';
import 'package:digital_shop/apps/authPage/controller/auth_controller.dart';
import 'package:digital_shop/apps/authPage/controller/login_page_controller.dart';
import 'package:digital_shop/apps/authPage/controller/password_reset_controller.dart';
import 'package:digital_shop/apps/authPage/controller/signup_page_controller.dart';
import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:digital_shop/apps/categoryPage/controller/category_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/buy_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/exchange_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/sell_history_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/sell_page_controller.dart';
import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:digital_shop/apps/productPage/controller/product_controller.dart';
import 'package:digital_shop/apps/checkoutPage/controller/checkout_page_controller.dart';
import 'package:digital_shop/apps/walletPage/controller/wallet_page_controller.dart';
import 'package:get/get.dart';

import '../apps/accountPage/controller/account_page_controller.dart';

import '../apps/mainPage/controller/main_page_controller.dart';
import '../apps/orderHistory/controller/order_history_page_controller.dart';
import '../apps/productDetailsPage/controller/product_details_page_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountPageController>(
      () => AccountPageController(),
      fenix: true,
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
      fenix: true,
    );
    Get.lazyPut<HomePageController>(
      () => HomePageController(),
      fenix: true,
    );
    Get.lazyPut<MainPageController>(
      () => MainPageController(),
      fenix: true,
    );
    Get.lazyPut<CheckoutPageController>(
      () => CheckoutPageController(),
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
    Get.lazyPut<ProductDetailsPageController>(
      () => ProductDetailsPageController(),
      fenix: true,
    );
    Get.lazyPut<AddressPageController>(
      () => AddressPageController(),
      fenix: true,
    );
    Get.lazyPut<OrderHistoryPageController>(
      () => OrderHistoryPageController(),
      fenix: true,
    );
    Get.lazyPut<PasswordResetController>(
      () => PasswordResetController(),
      fenix: true,
    );
    Get.lazyPut<WalletPageController>(
      () => WalletPageController(),
      fenix: true,
    );
  }
}
