import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../controller/category_page_controller.dart';

class CategoryPageView extends GetView<CategoryPageController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Config().init(context);
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('hello'),
      ),
      body: Center(
        child: Text('Category page'),
      ),
    );
  }
}
