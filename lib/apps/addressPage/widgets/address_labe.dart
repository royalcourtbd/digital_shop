import 'package:digital_shop/apps/addressPage/controller/address_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressLabel extends GetView<AddressPageController> {
  String title;
  VoidCallback onTap;
  Color? borderColor;
  AddressLabel({
    Key? key,
    required this.title,
    this.borderColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
