import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/exchangePage/controller/exchange_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExchangePageView extends GetView<ExchangePageController> {
  const ExchangePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const AutoSizeText('Convert Your Money'),
        centerTitle: true,
      ),
      // body: Center(
      //   child: Container(
      //     alignment: Alignment.center,
      //     color: Colors.black54,
      //     //height: Config.screenHeight! - 200,
      //     width: Config.screenWidth! - 50,
      //   ),
      // ),
    );
  }
}
