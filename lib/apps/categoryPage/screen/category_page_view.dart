import 'package:digital_shop/apps/categoryPage/widgets/categories_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../general/utils/config.dart';
import '../controller/category_page_controller.dart';

class CategoryPageView extends GetView<CategoryPageController> {
  const CategoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      key: controller.scaffoldKey,
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CategoriesWidget(),
          ],
        ),
      ),
    );
  }
}
