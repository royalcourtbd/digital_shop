import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/main_screen_controller.dart';

class MainScreenPageView extends GetView<MainScreenController> {
  const MainScreenPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to our App et, to ki hoise'),
      ),
      body: Column(
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/svg_icon/account.svg',
              height: 30,
              width: 30,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/svg_icon/cart.svg',
              width: 30,
              height: 30,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/svg_icon/category.svg',
              height: 30,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/svg_icon/exchange.svg',
              width: 30,
              height: 30,
            ),
          ),
          Center(
            child: SvgPicture.asset(
              'assets/svg_icon/home.svg',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
