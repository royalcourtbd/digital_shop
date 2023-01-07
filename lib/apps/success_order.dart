import 'package:digital_shop/apps/mainPage/screen/main_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSuccessfulPage extends StatelessWidget {
  static const String routeName = '/order_successful';

  const OrderSuccessfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Get.off(MainPageView());
          },
          child: const Text('Success'),
        ),
      ),
    );
  }
}
