import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../general/utils/config.dart';
import '../../productPage/model/products_model.dart';
import '../controller/product_details_page_controller.dart';

class ProductDetailsPageView extends GetView<ProductDetailsPageController> {
  ProductModel? productValue;
  ProductDetailsPageView({Key? key, this.productValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return const Scaffold(
      body: Center(
        child: Text('Category page'),
      ),
    );
  }
}
