import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:digital_shop/apps/productPage/widgets/product_view_widget.dart';
import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          children: [
            Container(
              height: Config.screenHeight! * .25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              child: const CarouselWidget(),
            ),
            Container(
              //height: Config.screenHeight! * .31,
              color: Colors.amber,
              child: const ProductViewWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
