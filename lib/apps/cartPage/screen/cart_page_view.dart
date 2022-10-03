import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPageView extends GetView<CartPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: controller.cartItemList.value.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              controller.cartItemList.value[index].discountPrice,
            ),
            trailing: Text(controller.cartItemList.value.length.toString()),
          );
        },
      ),
    );
  }
}
