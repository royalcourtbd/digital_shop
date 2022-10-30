import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/product_controller.dart';
import '../widgets/product_view_widget.dart';

class ProductsPageView extends GetView<ProductController> {
  const ProductsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: const [
            ProductViewWidget(),
          ],
        ),
      ),
    );
  }
}
