import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/main_screen_controller.dart';

class MainScreenPageView extends GetView<MainScreenController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to our App'),
      ),
    );
  }
}
