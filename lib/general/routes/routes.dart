import 'package:digital_shop/apps/accountPage/screen/account_page_view.dart';
import 'package:digital_shop/apps/addressPage/screen/add_address_page_view.dart';
import 'package:digital_shop/apps/authPage/screen/login_page_view.dart';
import 'package:digital_shop/apps/authPage/screen/password_reset.dart';
import 'package:digital_shop/apps/authPage/screen/signup_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/buy_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/exchange_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/sell_history_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/sell_page_view.dart';
import 'package:digital_shop/apps/homePage/screen/home_page_view.dart';
import 'package:digital_shop/apps/mainPage/screen/main_page_view.dart';
import 'package:digital_shop/apps/checkoutPage/screen/checkout_page_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../apps/addressPage/screen/address_page_view.dart';
import '../../apps/cartPage/screen/cart_page_view.dart';
import '../../apps/categoryPage/screen/category_page_view.dart';

class RoutesClass {
  static String mainPage = '/';
  static String accountPage = '/accountPage';
  static String cartPage = '/cartPage';
  static String categoryPage = '/categoryPage';
  static String exchangePage = '/exchangePage';
  static String homePage = '/homepage';
  static String checkout = '/checkout';
  static String buyPage = '/buyPage';
  static String sellPage = '/sellPage';
  static String sellHistory = '/sellHistory';
  static String loginPage = '/loginPage';
  static String signUpPage = '/signUpPage';
  static String productPage = '/productPage';
  static String productDetailPage = '/productDetailPage';
  static String addressPage = '/addressPage';
  static String addAddressPage = '/addAddressPage';
  static String passwordResetPage = '/passwordResetPage';

  static String getMainRoute() => mainPage;
  static String getAccountPageRoute() => accountPage;
  static String getCartPageRoute() => cartPage;
  static String getCategoryPageRoute() => categoryPage;
  static String getExchangePageRoute() => exchangePage;
  static String getHomePageRoute() => homePage;
  static String getCheckoutPageRoute() => checkout;
  static String getBuyPageRoute() => buyPage;
  static String getSellPageRoute() => sellPage;
  static String getSellHistoryPageRoute() => sellHistory;
  static String getLoginPageRoute() => loginPage;
  static String getSignUpPagePageRoute() => signUpPage;
  static String getProductPageRoute() => productPage;
  static String getProductDetailPageRoute() => productDetailPage;
  static String getAddressPageRoute() => addressPage;
  static String getAddAddressPageRoute() => addAddressPage;
  static String getPasswordResetPageRoute() => passwordResetPage;

  static List<GetPage> routes = [
    GetPage(
      page: () => MainPageView(),
      name: mainPage,
    ),
    GetPage(
      page: () => const AccountPageView(),
      name: accountPage,
    ),
    GetPage(
      page: () => const CartPageView(),
      name: cartPage,
    ),
    GetPage(
      page: () => const CategoryPageView(),
      name: categoryPage,
    ),
    GetPage(
      page: () => const ExchangePageView(),
      name: exchangePage,
    ),
    GetPage(
      page: () => const HomePageView(),
      name: homePage,
    ),
    GetPage(
      page: () => CheckoutPageView(),
      name: checkout,
    ),
    GetPage(
      page: () => const BuyPageView(),
      name: buyPage,
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: sellPage,
      page: () => SellPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: sellHistory,
      page: () => const SellHistoryPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: loginPage,
      page: () => const LoginPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: signUpPage,
      page: () => const SignUpPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    // GetPage(
    //   name: productPage,
    //   page: () =>  ProductsPageView(),
    //   // transition: Transition.leftToRight,
    //   // transitionDuration: const Duration(milliseconds: 1000),
    // ),
    // GetPage(
    //   name: productDetailPage,
    //   page: () => ProductDetailsPageView(),
    //   // transition: Transition.leftToRight,
    //   // transitionDuration: const Duration(milliseconds: 1000),
    // ),
    GetPage(
      name: addressPage,
      page: () => const AddressPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: addAddressPage,
      page: () => const AddAddressPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: passwordResetPage,
      page: () => PasswordResetPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
  ];
}
