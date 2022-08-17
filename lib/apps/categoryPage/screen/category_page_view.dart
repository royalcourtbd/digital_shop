import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../general/utils/config.dart';
import '../controller/category_page_controller.dart';

class CategoryPageView extends GetView<CategoryPageController> {
  const CategoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Config().init(context);
    return const Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Text('Category page'),
      ),
    );
  }
}
