import 'package:digital_shop/apps/exchangePage/controller/buy_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoTitle extends GetView<BuyPageController> {
  final String title;
  const InfoTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
