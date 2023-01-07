import 'package:digital_shop/apps/addressPage/controller/address_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressLabel extends GetView<AddressPageController> {
  String title;
  VoidCallback onTap;
  Color? backgroundColor;
  Color? borderColor;
  Color? textColor;
  AddressLabel({
    Key? key,
    required this.title,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor!),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
    );
  }
}
