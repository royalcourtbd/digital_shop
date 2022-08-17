import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
