import 'package:digital_shop/apps/categoryPage/controller/category_page_controller.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_image/shimmer_image.dart';

import '../../productPage/screen/products_page_view.dart';

class CategoriesWidget extends GetView<CategoryPageController> {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return GetX(
      init: CategoryPageController(),
      builder: <CategoryPageController>(controller) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            padding: const EdgeInsets.all(0),
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.categoryList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 240 / 250,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () async {
                  Get.dialog(const AlertDialog(
                    content: SizedBox(
                      height: 50,
                      width: 40,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ));
                  categoryPageController.getProducts(
                    controller.categoryList[index].categoryName!,
                  );
                  categoryPageController.productsSnapshot(
                    controller.categoryList[index].categoryName!,
                  );

                  await Future.delayed(const Duration(seconds: 2));
                  Get.back();

                  Get.to(
                    () => ProductsPageView(
                      title: controller.categoryList[index].categoryName!,
                      products: categoryPageController.getProductByCategory,
                    ),
                  );
                  mainPageController.interstitialAd.show();
                  // Fluttertoast.showToast(
                  //   msg: controller.categoryList[index].categoryName!,
                  //   toastLength: Toast.LENGTH_SHORT,
                  //   gravity: ToastGravity.BOTTOM,
                  //   timeInSecForIosWeb: 1,
                  //   backgroundColor: Colors.green,
                  //   textColor: Colors.white70,
                  //   fontSize: 16.0,
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(
                      int.parse(
                        '0xff${controller.categoryList[index].bgColor.replaceAll('#', '')}',
                      ),
                    ).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color(
                        int.parse(
                          '0xff${controller.categoryList[index].bgColor.replaceAll('#', '')}',
                        ),
                      ).withOpacity(0.7),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: Config.screenWidth! * .34,
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8)),
                          child: ProgressiveImage(
                            imageError: 'assets/images/loading.jpg',
                            image: controller.categoryList[index].image,
                            height: Config.screenWidth! * .34,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        controller.categoryList[index].categoryName,
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
