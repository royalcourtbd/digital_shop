import 'package:digital_shop/apps/addressPage/controller/address_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressLabel extends GetView<AddressPageController> {
  String title;
  AddressLabel({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
