import 'package:badges/badges.dart';
import 'package:digital_shop/apps/cartPage/screen/cart_page_view.dart';
import 'package:digital_shop/apps/categoryPage/screen/category_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/exchange_page_view.dart';
import 'package:digital_shop/apps/homePage/screen/home_page_view.dart';
import 'package:digital_shop/apps/widgets/drawer_for_exchange_page.dart';
import 'package:digital_shop/apps/widgets/drawer_for_other_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../general/constants/constants.dart';
import '../../../general/routes/routes.dart';
import '../../../general/utils/config.dart';
import '../../accountPage/screen/account_page_view.dart';
import '../controller/main_page_controller.dart';
import '../widgets/bottom_menu_item_widget.dart';

class MainPageView extends GetView<MainPageController> {
  MainPageView({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> pages = [
    {'page': const ExchangePageView(), 'title': 'Convert Your Money'},
    {'page': const CategoryPageView(), 'title': 'Category'},
    {'page': const HomePageView(), 'title': 'Home'},
    {'page': const CartPageView(), 'title': 'Cart'},
    {'page': AccountPageView(), 'title': 'Account'}
  ];

  // Widget currentPage = HomePageView();
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return WillPopScope(
      onWillPop: () => homePageController.exitButton(),
      child: Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(pages[controller.currentIndex.value]['title'])),
          elevation: 0.0,
          centerTitle: true,
          actions: [
            Obx(
              () => controller.currentIndex == 4 &&
                      authController.user.value != null
                  ? IconButton(
                      onPressed: () {
                        authController.signOut();
                      },
                      icon: const Icon(IconlyLight.logout),
                    )
                  : const SizedBox(),
            )
          ],
        ),
        drawer: Obx(
          // ignore: unrelated_type_equality_checks
          () =>
              controller.currentIndex == 0 && authController.user.value != null
                  ? const DrawerForExchangePage()
                  : const DrawerForOtherPage(),
        ),
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Obx(
          () => pages[controller.currentIndex.value]['page'],
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
                    Obx(
                      () => authController.user.value != null
                          ? Badge(
                              toAnimate: false,
                              ignorePointer: true,
                              alignment: Alignment.center,
                              badgeColor: Colors.green,
                              padding: const EdgeInsets.all(3),
                              showBadge: cartPageController.cartLength > 0
                                  ? true
                                  : false,
                              position: BadgePosition.topEnd(
                                top: 5,
                                end: 5,
                              ),
                              badgeContent: Text(
                                cartPageController.cartLength.toString(),
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
                            )
                          : BottomMenuItemWidget(
                              svgIcon: 'cart.svg',
                              onPressed: (() {
                                controller.currentIndex.value = 3;
                              }),
                              buttonName: 'Cart',
                              fontSize: 10,
                              color: 3,
                            ),
                    ),
                    BottomMenuItemWidget(
                      svgIcon: 'account.svg',
                      onPressed: (() async {
                        if (authController.user.value != null) {
                          Get.dialog(const AlertDialog(
                            content: SizedBox(
                              height: 50,
                              width: 40,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                          ));
                          await Future.delayed(const Duration(seconds: 2));
                          Get.back();
                          controller.currentIndex.value = 4;
                        } else {
                          controller.currentIndex.value = 4;
                          Column(
                            children: [
                              Image.asset(
                                'assets/images/oops.jpg',
                                scale: 2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Config.screenWidth! * .2,
                                    vertical: Config.screenHeight! * .02,
                                  ),
                                ),
                                child: const Text('Please Login Your Account'),
                                onPressed: () {
                                  Get.offAllNamed(
                                      RoutesClass.getLoginPageRoute());
                                },
                              ),
                            ],
                          );
                        }
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
      ),
    );
  }
}
