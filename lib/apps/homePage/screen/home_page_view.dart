import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/homePage/widgets/home_upper_row_widget.dart';
import 'package:digital_shop/apps/productPage/widgets/product_view_widget.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iconly/iconly.dart';

import '../../../general/utils/config.dart';
import '../../productPage/screen/products_page_view.dart';
import '../../productPage/widgets/featured_product_widget.dart';
import '../controller/home_page_controller.dart';
import '../widgets/carousel_widget.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Config.screenHeight! * .29,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
              ),
              child: const CarouselWidget(),
            ),
            SizedBox(
              height: Config.screenHeight! * .03,
            ),
            HomeUpperRowWidget(icon: controller.icon),
            SizedBox(
              height: Config.screenHeight! * .02,
            ),

            Container(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () async {
                  Get.dialog(const AlertDialog(
                    content: SizedBox(
                      height: 50,
                      width: 40,
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ));
                  await Future.delayed(const Duration(seconds: 2));
                  Get.back();

                  Get.to(
                    () => ProductsPageView(
                      title: 'Featured Product',
                      products: productController.featuredProduct,
                    ),
                  );
                  mainPageController.interstitialAd.show();
                },
                child: const Chip(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  label: AutoSizeText(
                    'View All',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),

            Row(
              children: [
                const RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      Text(
                        'On Sale',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                        size: 30,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: Config.screenHeight! * .37,
                    child: const featuredProductWidget(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              height: mainPageController.bannerAd.size.height.toDouble(),
              width: mainPageController.bannerAd.size.width.toDouble(),
              child: Obx(
                () => mainPageController.googleAdsModel.value!.banner1 != null
                    ? AdWidget(ad: mainPageController.bannerAd)
                    : const SizedBox(),
              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: AutoSizeText(
                    'Just For You',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: InkWell(
                    onTap: () async {
                      Get.dialog(const AlertDialog(
                        content: SizedBox(
                          height: 50,
                          width: 40,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                      ));
                      await Future.delayed(const Duration(seconds: 2));
                      Get.back();
                      Get.to(
                        () => ProductsPageView(
                          title: 'All Products',
                          products: productController.productsList,
                        ),
                      );
                      mainPageController.interstitialAd.show();
                    },
                    child: const Chip(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      label: AutoSizeText(
                        'Browse All',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const ProductViewWidget(),
            const SizedBox(
              height: 60,
            )

            //const TestWidget(),
          ],
        ),
      ),
    );
  }
}
