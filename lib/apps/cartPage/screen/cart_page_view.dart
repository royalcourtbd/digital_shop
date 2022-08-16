import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';

class CartPageView extends GetView<CartPageController> {
  const CartPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Config().init(context);
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Center(
        child: Text('Cart Page'),
      ),
    );
  }
}
