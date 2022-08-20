import 'package:digital_shop/apps/exchangePage/controller/exchange_page_controller.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../widgets/exchange_item_widget.dart';
import '../widgets/exchange_page_heading_widget.dart';

class ExchangePageView extends GetView<ExchangePageController> {
  const ExchangePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    // TODO: implement build
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: controller.scrollController,
        child: Column(
          children: [
            ExchangePageHeadingWidget(
              headingText: 'Welcome to Digital Shop Virtual Dollar Center!',
            ),
            const SizedBox(
              height: 10,
            ),
            ExchangeItemWidget(
              itemName: 'Buy Dollar',
              onTap: () {
                Get.toNamed(RoutesClass.getBuyPageRoute());
                //print('Buy Dollar From here');
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
                print('Sell Dollar From here');
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
                print('Exchange Dollar From here');
              },
              svgIcon: 'exchange_icon.svg',
            ),
          ],
        ),
      ),
    );
  }
}
