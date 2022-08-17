import 'package:digital_shop/apps/accountPage/screen/account_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/exchange_page_view.dart';
import 'package:digital_shop/apps/homePage/screen/home_page_view.dart';
import 'package:digital_shop/apps/mainPage/screen/main_page_view.dart';
import 'package:digital_shop/apps/profilePage/screen/profile_page_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

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

  static String getMainRoute() => mainPage;
  static String getAccountPageRoute() => accountPage;
  static String getCartPageRoute() => cartPage;
  static String getCategoryPageRoute() => categoryPage;
  static String getExchangePageRoute() => exchangePage;
  static String getHomePageRoute() => homePage;
  static String getProfilePageRoute() => profilePage;

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
      page: () => CategoryPageView(),
      name: categoryPage,
    ),
    GetPage(
      page: () => ExchangePageView(),
      name: exchangePage,
    ),
    GetPage(
      page: () => HomePageView(),
      name: homePage,
    ),
    GetPage(
      page: () => ProfilePageView(),
      name: profilePage,
    ),
  ];
}
