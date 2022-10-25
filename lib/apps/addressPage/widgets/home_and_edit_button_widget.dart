import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';

class HomeAndEditButtonWidget extends StatelessWidget {
  String title;
  double height, width, fontSize;
  Color bgColor, borderColor, fontColor;
  HomeAndEditButtonWidget({
    Key? key,
    required this.title,
    this.height = 20,
    this.width = 50,
    this.fontSize = 12,
    this.bgColor = Colors.green,
    this.borderColor = Colors.green,
    this.fontColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      height: height,
      width: width,
      //padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(2),
        color: bgColor,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
        ),
      ),
    );
  }
}
