import 'package:digital_shop/apps/exchangePage/controller/exchange_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangePageView extends GetView<ExchangePageController> {
  const ExchangePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      extendBody: true,
      backgroundColor: Colors.amberAccent,
    );
  }
}
