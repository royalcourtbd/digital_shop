import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/mainPage/controller/main_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DrawerListItem extends GetView<MainPageController> {
  String title;
  IconData icon;
  Color color;
  Color materialColor;
  VoidCallback onPressed;
  //bool? selected;

  DrawerListItem({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.color,
    required this.materialColor,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: materialColor,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 24,
                  color: color,
                ),
              ),
              Expanded(
                flex: 5,
                child: AutoSizeText(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 15,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
