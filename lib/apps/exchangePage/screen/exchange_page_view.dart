import 'dart:developer';

import 'package:digital_shop/apps/exchangePage/controller/exchange_page_controller.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/constants/constants.dart';
import '../../../general/utils/config.dart';
import '../widgets/exchange_item_widget.dart';
import '../widgets/exchange_page_heading_widget.dart';

class ExchangePageView extends GetView<ExchangePageController> {
  const ExchangePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Obx(
        () => authController.user.value != null
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                controller: controller.scrollController,
                child: Column(
                  children: [
                    const ExchangePageHeadingWidget(
                      headingText:
                          'Welcome to Digital Shop Virtual Dollar Center!',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ExchangeItemWidget(
                      itemName: 'Buy Dollar',
                      onTap: () {
                        Get.toNamed(RoutesClass.getBuyPageRoute());
                      },
                      color: const Color(0XFFF7ECDE),
                      svgIcon: 'buy_icon.svg',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ExchangeItemWidget(
                      itemName: 'Sell Dollar',
                      color: const Color(0xffE9DAC1),
                      onTap: () {
                        Get.toNamed(RoutesClass.getSellPageRoute());
                        if (kDebugMode) {
                          log('Sell Dollar From here');
                        }
                      },
                      svgIcon: 'sell_icon.svg',
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ExchangeItemWidget(
                      itemName: 'Exchange Dollar',
                      color: const Color(0xffFCE2DB),
                      onTap: () {
                        Get.snackbar(
                          'Exchange Dollar',
                          'This feature is not availabe now',
                          //duration: const Duration(seconds: 1),
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      svgIcon: 'exchange_icon.svg',
                    ),
                  ],
                ),
              )
            : Column(
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
                      Get.offAllNamed(RoutesClass.getLoginPageRoute());
                    },
                  ),
                ],
              ),
      ),
    );
  }
}
