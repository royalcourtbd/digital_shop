import 'package:digital_shop/apps/exchangePage/controller/buy_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/controller/sell_page_controller.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';

class BuyMethodBDTIcon extends GetView<BuyPageController> {
  const BuyMethodBDTIcon({super.key});

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
            : FancyShimmerImage(
                errorWidget: Image.asset('assets/images/loading.jpg'),
                imageUrl: controller.imageBdt.value,
                boxFit: BoxFit.fill,
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
                fit: BoxFit.fill,
              )
            : FancyShimmerImage(
                errorWidget: Image.asset('assets/images/loading.jpg'),
                imageUrl: controller.imageUsd.value,
                boxFit: BoxFit.fill,
              ),
      ),
    );
  }
}

class SellMethodUSDIcon extends GetView<SellPageController> {
  const SellMethodUSDIcon({super.key});

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
            : FancyShimmerImage(
                errorWidget: Image.asset('assets/images/loading.jpg'),
                imageUrl: controller.imageUsd.value,
                boxFit: BoxFit.fill,
              ),
      ),
    );
  }
}

class SellMethodBDTIcon extends GetView<SellPageController> {
  const SellMethodBDTIcon({super.key});

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
            : FancyShimmerImage(
                imageUrl: controller.imageBdt.value,
                boxFit: BoxFit.fill,
                errorWidget: Image.asset('assets/images/loading.jpg'),
              ),
      ),
    );
  }
}
