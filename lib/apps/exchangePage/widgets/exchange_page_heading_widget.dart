import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../controller/exchange_page_controller.dart';

class ExchangePageHeadingWidget extends GetView<ExchangePageController> {
  String headingText;
  ExchangePageHeadingWidget({Key? key, required this.headingText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(5),
      alignment: Alignment.center,
      height: Config.screenHeight! * .2,
      //width: Config.screenWidth! - 20,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        //color: Colors.grey.shade200,
        boxShadow: [
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-1, -1),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(1, 1),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: AutoSizeText(
        //maxLines: 2,
        headingText,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          //letterSpacing: 3,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
