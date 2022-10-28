import 'package:digital_shop/apps/addressPage/controller/address_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressLabel extends GetView<AddressPageController> {
  String title;
  VoidCallback onTap;
  AddressLabel({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Obx(() => Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: controller.selectLabel.value != true
                    ? Colors.black26
                    : Colors.green,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              title,
              style: const TextStyle(fontSize: 15),
            ),
          )),
    );
  }
}
