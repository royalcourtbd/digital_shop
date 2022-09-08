import 'package:digital_shop/apps/cartPage/screen/cart_page_view.dart';
import 'package:digital_shop/apps/categoryPage/screen/category_page_view.dart';
import 'package:digital_shop/apps/exchangePage/screen/exchange_page_view.dart';
import 'package:digital_shop/apps/homePage/screen/home_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../../accountPage/screen/account_page_view.dart';
import '../controller/main_page_controller.dart';
import '../widgets/bottom_menu_item_widget.dart';

class MainPageView extends GetView<MainPageController> {
  MainPageView({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const ExchangePageView(),
    const CategoryPageView(),
    HomePageView(),
    const CartPageView(),
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
            controller.currentIndex == 0
                ? 'Convert Your Money '
                : controller.currentIndex == 1
                    ? 'Category'
                    : controller.currentIndex == 2
                        ? 'Home'
                        : controller.currentIndex == 3
                            ? 'Cart'
                            : 'Account',
          ),
        ),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Obx(
        () => pages[controller.currentIndex.value],
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            'assets/svg_icon/home.svg',
            height: 32,
            width: 32,
            alignment: Alignment.center,
            theme: const SvgTheme(),
            color: controller.currentIndex.value == 2
                ? const Color(0xffc67752)
                : Colors.black,
            allowDrawingOutsideViewBox: true,
          ),
          onPressed: () {
            controller.currentIndex.value = 2;
          },
        ),
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
                    color: 0,
                  ),
                  BottomMenuItemWidget(
                    svgIcon: 'category.svg',
                    onPressed: (() {
                      controller.currentIndex.value = 1;
                    }),
                    buttonName: 'Category',
                    color: 1,
                  ),
                ],
              ),
              //Bottom Right Side Button
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BottomMenuItemWidget(
                    svgIcon: 'cart.svg',
                    onPressed: (() {
                      controller.currentIndex.value = 3;
                    }),
                    buttonName: 'Cart',
                    color: 3,
                  ),
                  BottomMenuItemWidget(
                    svgIcon: 'account.svg',
                    onPressed: (() {
                      controller.currentIndex.value = 4;
                    }),
                    buttonName: 'Account',
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
