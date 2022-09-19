import 'package:digital_shop/apps/authPage/controller/login_page_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../general/utils/config.dart';

class BackGround extends GetView<LoginPageController> {
  final Widget child;

  const BackGround({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return SizedBox(
      //alignment: Alignment.centerLeft,
      width: double.infinity,
      height: Config.screenHeight!,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/top1.png',
              width: Config.screenWidth!,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/top2.png',
              width: Config.screenWidth!,
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Image.asset(
              'assets/images/main.png',
              width: Config.screenWidth! * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom1.png',
              width: Config.screenWidth!,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              'assets/images/bottom2.png',
              width: Config.screenWidth!,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
