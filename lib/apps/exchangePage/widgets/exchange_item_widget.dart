import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../controller/exchange_page_controller.dart';

class ExchangeItemWidget extends GetView<ExchangePageController> {
  final String svgIcon;
  final String itemName;
  final VoidCallback onTap;
  final Color color;
  const ExchangeItemWidget({
    Key? key,
    required this.svgIcon,
    required this.itemName,
    required this.onTap,
    this.color = Colors.white30,
  }) : super(key: key);

  // List<Color> colors = [
  //   Color(0xffFCE2DB),
  //   Color(0xffFCE2DB),
  //   Color(0xffFCE2DB),
  // ];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        height: Config.screenHeight! * .17,
        width: Config.screenWidth! * .9,
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            const BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.grey.shade400,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              itemName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w400,
                letterSpacing: 3,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            SvgPicture.asset(
              'assets/svg_icon/$svgIcon',
              height: Config.screenHeight! * .08,
              width: Config.screenWidth! * .08,
            ),
          ],
        ),
      ),
    );
  }
}
