import 'package:digital_shop/apps/accountPage/screen/account_page_view.dart';
import 'package:digital_shop/apps/authPage/screen/login_page_view.dart';
import 'package:digital_shop/apps/authPage/screen/signup_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/buy_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/exchange_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/sell_history_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/sell_page_view.dart';
import 'package:digital_shop/apps/homePage/screen/home_page_view.dart';
import 'package:digital_shop/apps/mainPage/screen/main_page_view.dart';
import 'package:digital_shop/apps/productDetailsPage/screen/product_details_page_view.dart';
import 'package:digital_shop/apps/productPage/screen/products_page_view.dart';
import 'package:digital_shop/apps/profilePage/screen/profile_page_view.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../apps/cartPage/screen/cart_page_view.dart';
import '../../apps/categoryPage/screen/category_page_view.dart';

class RoutesClass {
  static String mainPage = '/';
  static String accountPage = '/accountPage';
  static String cartPage = '/cartPage';
  static String categoryPage = '/categoryPage';
  static String exchangePage = '/exchangePage';
  static String homePage = '/homepage';
  static String profilePage = '/profilePage';
  static String buyPage = '/buyPage';
  static String sellPage = '/sellPage';
  static String sellHistory = '/sellHistory';
  static String loginPage = '/loginPage';
  static String signUpPage = '/signUpPage';
  static String productPage = '/productPage';
  static String productDetailPage = '/productDetailPage';

  static String getMainRoute() => mainPage;
  static String getAccountPageRoute() => accountPage;
  static String getCartPageRoute() => cartPage;
  static String getCategoryPageRoute() => categoryPage;
  static String getExchangePageRoute() => exchangePage;
  static String getHomePageRoute() => homePage;
  static String getProfilePageRoute() => profilePage;
  static String getBuyPageRoute() => buyPage;
  static String getSellPageRoute() => sellPage;
  static String getSellHistoryPageRoute() => sellHistory;
  static String getLoginPageRoute() => loginPage;
  static String getSignUpPagePageRoute() => signUpPage;
  static String getProductPageRoute() => productPage;
  static String getProductDetailPageRoute() => productDetailPage;

  static List<GetPage> routes = [
    GetPage(
      page: () => MainPageView(),
      name: mainPage,
    ),
    GetPage(
      page: () => AccountPageView(),
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
      page: () => ExchangePageView(),
      name: exchangePage,
    ),
    GetPage(
      page: () => const HomePageView(),
      name: homePage,
    ),
    GetPage(
      page: () => ProfilePageView(),
      name: profilePage,
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
      page: () => LoginPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: signUpPage,
      page: () => SignUpPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    GetPage(
      name: productPage,
      page: () => const ProductsPageView(),
      // transition: Transition.leftToRight,
      // transitionDuration: const Duration(milliseconds: 1000),
    ),
    // GetPage(
    //   name: productDetailPage,
    //   page: () => ProductDetailsPageView(),
    //   // transition: Transition.leftToRight,
    //   // transitionDuration: const Duration(milliseconds: 1000),
    // ),
  ];
}
