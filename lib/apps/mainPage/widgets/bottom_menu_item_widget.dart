import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../controller/main_page_controller.dart';

class BottomMenuItemWidget extends GetView<MainPageController> {
  String svgIcon;
  String buttonName;
  VoidCallback onPressed;
  double fontSize;
  int color;
  BottomMenuItemWidget({
    Key? key,
    required this.svgIcon,
    required this.onPressed,
    required this.buttonName,
    this.fontSize = 12.0,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Obx(
      () => MaterialButton(
        minWidth: 40.0,
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg_icon/$svgIcon',
              height: Config.screenHeight! * .03,
              width: Config.screenWidth! * .03,
              color: controller.currentIndex.value == color
                  ? Colors.green
                  : Colors.black54,
            ),
            const SizedBox(
              height: 2,
            ),
            AutoSizeText(
              buttonName,
              style: TextStyle(
                fontSize: fontSize,
                color: controller.currentIndex.value == color
                    ? Colors.green
                    : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
