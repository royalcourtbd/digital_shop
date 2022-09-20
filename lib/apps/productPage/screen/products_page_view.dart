import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../homePage/widgets/carousel_widget.dart';
import '../controller/product_controller.dart';
import '../widgets/product_view_widget.dart';

class ProductsPageView extends GetView<ProductController> {
  const ProductsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context); // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.addProducts();
              },
              icon: const Icon(Icons.abc))
        ],
      ),
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
            ProductViewWidget(),
          ],
        ),
      ),
    );
  }
}
