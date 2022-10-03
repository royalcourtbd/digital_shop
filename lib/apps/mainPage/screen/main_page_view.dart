import 'package:badges/badges.dart';
import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:digital_shop/apps/cartPage/screen/cart_page_view.dart';
import 'package:digital_shop/apps/categoryPage/screen/category_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/exchange_page_view.dart';
import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:digital_shop/apps/homePage/screen/home_page_view.dart';
import 'package:digital_shop/apps/productPage/controller/product_controller.dart';
import 'package:digital_shop/apps/widgets/drawer_for_exchange_page.dart';
import 'package:digital_shop/apps/widgets/drawer_for_other_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../../accountPage/screen/account_page_view.dart';
import '../../authPage/controller/auth_controller.dart';
import '../controller/main_page_controller.dart';
import '../widgets/bottom_menu_item_widget.dart';

class MainPageView extends GetView<MainPageController> {
  MainPageView({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());
  CartPageController cartPageController = Get.put(CartPageController());
  final ProductController productController = Get.put(ProductController());
  final HomePageController homePageController = Get.put(HomePageController());

  final List<Widget> pages = [
    ExchangePageView(),
    const CategoryPageView(),
    const HomePageView(),
    CartPageView(),
    const AccountPageView(),
  ];

  // Widget currentPage = HomePageView();
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            // ignore: unrelated_type_equality_checks
            controller.currentIndex == 0
                ? 'Convert Your Money '
                // ignore: unrelated_type_equality_checks
                : controller.currentIndex == 1
                    ? 'Category'
                    // ignore: unrelated_type_equality_checks
                    : controller.currentIndex == 2
                        ? 'Home'
                        // ignore: unrelated_type_equality_checks
                        : controller.currentIndex == 3
                            ? 'Cart'
                            : 'Account',
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(Icons.login),
          ),
          IconButton(
            onPressed: () {
              productController.addProducts();
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              homePageController.addProducts();
            },
            icon: const Icon(Icons.card_travel),
          ),
        ],
      ),
      drawer: Obx(
        // ignore: unrelated_type_equality_checks
        () => controller.currentIndex == 0 && authController.user.value != null
            ? const DrawerForExchangePage()
            : const DrawerForOtherPage(),
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Obx(
        () => pages[controller.currentIndex.value],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
        onPressed: () {
          controller.currentIndex.value = 2;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        notchMargin: 6,
        child: SizedBox(
          height: Config.screenHeight! * 0.07,
          //Bottom Left Side Button
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomMenuItemWidget(
                    svgIcon: 'exchange.svg',
                    onPressed: (() {
                      controller.currentIndex.value = 0;
                    }),
                    buttonName: 'Exchange',
                    fontSize: 10,
                    color: 0,
                  ),
                  BottomMenuItemWidget(
                    svgIcon: 'category.svg',
                    onPressed: (() {
                      controller.currentIndex.value = 1;
                    }),
                    buttonName: 'Category',
                    fontSize: 10,
                    color: 1,
                  ),
                ],
              ),
              //Bottom Right Side Button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Badge(
                        toAnimate: false,
                        ignorePointer: true,
                        alignment: Alignment.center,
                        badgeColor: Colors.green,
                        padding: const EdgeInsets.all(3),
                        showBadge:
                            cartPageController.cartLength > 0 ? true : false,
                        position: BadgePosition.topEnd(
                          top: 5,
                          end: 5,
                        ),
                        badgeContent: Text(
                          cartPageController.cartItemList.value.length
                              .toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        child: BottomMenuItemWidget(
                          svgIcon: 'cart.svg',
                          onPressed: (() {
                            controller.currentIndex.value = 3;
                          }),
                          buttonName: 'Cart',
                          fontSize: 10,
                          color: 3,
                        ),
                      )),
                  BottomMenuItemWidget(
                    svgIcon: 'account.svg',
                    onPressed: (() {
                      controller.currentIndex.value = 4;
                    }),
                    buttonName: 'Account',
                    fontSize: 10,
                    color: 4,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
