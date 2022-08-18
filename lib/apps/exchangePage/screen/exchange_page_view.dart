import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/exchangePage/controller/exchange_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../widgets/exchange_item_widget.dart';

class ExchangePageView extends GetView<ExchangePageController> {
  const ExchangePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    // TODO: implement build
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: Center(
        heightFactor: Config.screenHeight!,
        child: ListView(
          shrinkWrap: true,
          controller: controller.scrollController,
          physics: BouncingScrollPhysics(),
          //mainAxisAlignment: MainAxisAlignment,
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.center,
              height: Config.screenHeight! * .2,
              //width: Config.screenWidth! - 20,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-1, -1),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(1, 1),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: const AutoSizeText(
                //maxLines: 2,
                'Welcome to Digital Shop Virtual Dollar Center',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 3,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ExchangeItemWidget(
              onTap: () {
                print('Buy Dollar From here');
              },
              svgIcon: 'sell_icon.svg',
            ),
            const SizedBox(
              height: 15,
            ),
            ExchangeItemWidget(
              onTap: () {
                print('Sell Dollar From here');
              },
              svgIcon: 'buy_icon.svg',
            ),
            const SizedBox(
              height: 15,
            ),
            ExchangeItemWidget(
              onTap: () {
                print('Exchange Dollar From here');
              },
              svgIcon: 'exchange_icon.svg',
            ),
            const SizedBox(
              height: 15,
            ),
            ExchangeItemWidget(
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
