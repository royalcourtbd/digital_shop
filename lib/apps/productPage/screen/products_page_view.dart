import 'package:digital_shop/apps/productPage/widgets/product_view_widget.dart';
import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/product_controller.dart';

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
          children: const [
            ProductViewWidget(),
            ProductViewWidget(),
            ProductViewWidget(),
          ],
        ),
      ),
    );
  }
}
