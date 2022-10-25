import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/homePage/widgets/home_upper_row_widget.dart';
import 'package:digital_shop/apps/productPage/widgets/product_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../../../test.dart';
import '../controller/home_page_controller.dart';
import '../widgets/carousel_widget.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Config.screenHeight! * .25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              child: const CarouselWidget(),
            ),
            SizedBox(
              height: Config.screenHeight! * .03,
            ),
            HomeUpperRowWidget(icon: controller.icon),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 15,
                bottom: 15,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const AutoSizeText(
                  'Your Favourite Deals',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            ProductViewWidget(),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 15,
                bottom: 15,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: const AutoSizeText(
                  'Just For You',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            TestWidget(),
          ],
        ),
      ),
    );
  }
}
