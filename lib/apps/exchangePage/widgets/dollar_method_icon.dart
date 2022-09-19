import 'package:digital_shop/apps/exchangePage/controller/buy_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/sell_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';

class BuyMethodBDTIcon extends GetView<BuyPageController> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(3),
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.white30,
          border: Border(
            right: BorderSide(
              color: Colors.green,
              width: 1,
            ),
          ),
        ),
        child: controller.imageBdt.value == 'assets/currency/bank.png'
            ? Image.asset(
                controller.imageBdt.value,
                fit: BoxFit.cover,
              )
            : Image.network(
                controller.imageBdt.value,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class BuyMethodUSDIcon extends GetView<BuyPageController> {
  const BuyMethodUSDIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(3),
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.white30,
          border: Border(
              right: BorderSide(
            color: Colors.green,
            width: 1,
          )),
        ),
        child: controller.imageUsd.value == 'assets/currency/bank.png'
            ? Image.asset(
                controller.imageUsd.value,
                fit: BoxFit.cover,
              )
            : Image.network(
                controller.imageUsd.value,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class SellMethodUSDIcon extends GetView<SellPageController> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(3),
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.white30,
          border: Border(
              right: BorderSide(
            color: Colors.green,
            width: 1,
          )),
        ),
        child: controller.imageUsd.value == 'assets/currency/bank.png'
            ? Image.asset(
                controller.imageUsd.value,
                fit: BoxFit.cover,
              )
            : Image.network(
                controller.imageUsd.value,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class SellMethodBDTIcon extends GetView<SellPageController> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(3),
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.white30,
          border: Border(
            right: BorderSide(
              color: Colors.green,
              width: 1,
            ),
          ),
        ),
        child: controller.imageBdt.value == 'assets/currency/bank.png'
            ? Image.asset(
                controller.imageBdt.value,
                fit: BoxFit.cover,
              )
            : Image.network(
                controller.imageBdt.value,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
