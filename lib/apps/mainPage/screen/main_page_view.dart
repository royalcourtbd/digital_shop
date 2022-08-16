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

class MainPageView extends GetView<MainPageController> {
  MainPageView({Key? key}) : super(key: key);

  final List<Widget> pages = [
    ExchangePageView(),
    CategoryPageView(),
    HomePageView(),
    const CartPageView(),
    const AccountPageView(),
  ];

  // Widget currentPage = HomePageView();
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      //backgroundColor: Colors.transparent,

      body: Obx(
        () => pages[controller.currentIndex.value],
      ),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset(
          'assets/svg_icon/home.svg',
          height: 35,
          width: 35,
          alignment: Alignment.center,
          theme: const SvgTheme(),
          color: Colors.white,
        ),
        onPressed: () {
          controller.currentIndex.value = 2;
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      // currentPage = HomePageView();
                      controller.currentIndex.value = 0;
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg_icon/exchange.svg',
                          height: 35,
                          width: 35,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      controller.currentIndex.value = 1;
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg_icon/category.svg',
                          height: 35,
                          width: 35,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      controller.currentIndex.value = 3;
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg_icon/cart.svg',
                          height: 35,
                          width: 35,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40.0,
                    onPressed: () {
                      controller.currentIndex.value = 4;
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg_icon/account.svg',
                          height: 35,
                          width: 35,
                        ),
                      ],
                    ),
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
