import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:digital_shop/apps/cartPage/widgets/body_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPageView extends GetView<CartPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyView(),
    );
  }
}
