import 'package:digital_shop/apps/exchangePage/controller/sell_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellPageView extends GetView<SellPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sell Dollar'),
      ),
    );
  }
}
