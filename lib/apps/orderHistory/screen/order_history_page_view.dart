import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/order_history_page_controller.dart';

class OrderHistoryPageView extends GetView<OrderHistoryPageController> {
  const OrderHistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return const Scaffold();
  }
}
