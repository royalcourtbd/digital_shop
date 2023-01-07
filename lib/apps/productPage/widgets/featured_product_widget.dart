import 'package:digital_shop/apps/productPage/controller/product_controller.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../productDetailsPage/screen/product_details_page_view.dart';
import '../../../general/constants/constants.dart';
import '../../../general/utils/config.dart';

class featuredProductWidget extends GetView<ProductController> {
  const featuredProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Obx(
      () => ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        //itemCount: 7,
        itemCount: productController.featuredProduct.length > 4
            ? 4
            : productController.featuredProduct.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3),
            child: InkWell(
              onTap: () {
                Get.to(
                  () => ProductDetailsPageView(
                    productValue: productController.featuredProduct[index],
                  ),
                );
              },
              child: Card(
                child: SizedBox(
                  width: Config.screenWidth! * .48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                            //bottomRight: Radius.circular(4),
                          ),
                        ),
                        width: double.infinity,
                        height: Config.screenHeight! * .18,
                        child: Obx(
                          () => ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              topRight: Radius.circular(4),
                              //bottomRight: Radius.circular(4),
                            ),
                            child: FancyShimmerImage(
                              errorWidget:
                                  Image.asset('assets/images/loading.jpg'),
                              imageUrl: productController
                                  .featuredProduct[index].image![0],
                              width: double.infinity,
                              height: Config.screenHeight! * .16,
                              boxFit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 8),
                        child: Row(
                          children: [
                            Container(
                              child: productController.featuredProduct[index]
                                          .discountPrice! ==
                                      0
                                  ? null
                                  : Text(
                                      '${productController.featuredProduct[index].discountPrice} ৳',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: 'Poppins',
                                      ),
                                    ),
                            ),
                            SizedBox(
                              width: productController
                                              .featuredProduct[index].price! >
                                          productController
                                              .featuredProduct[index]
                                              .discountPrice! &&
                                      productController.featuredProduct[index]
                                              .discountPrice !=
                                          0
                                  ? 15
                                  : 0,
                            ),
                            Text(
                              '${productController.featuredProduct[index].price}৳',
                              style: TextStyle(
                                fontSize: productController
                                                .featuredProduct[index].price! >
                                            productController
                                                .featuredProduct[index]
                                                .discountPrice! &&
                                        productController.featuredProduct[index]
                                                .discountPrice !=
                                            0
                                    ? 14
                                    : 16,
                                color: productController
                                                .featuredProduct[index].price! >
                                            productController
                                                .featuredProduct[index]
                                                .discountPrice! &&
                                        productController.featuredProduct[index]
                                                .discountPrice !=
                                            0
                                    ? null
                                    : Colors.red,
                                fontWeight: productController
                                                .featuredProduct[index].price! >
                                            productController
                                                .featuredProduct[index]
                                                .discountPrice! &&
                                        productController.featuredProduct[index]
                                                .discountPrice !=
                                            0
                                    ? null
                                    : FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                                decoration: productController
                                                .featuredProduct[index].price! >
                                            productController
                                                .featuredProduct[index]
                                                .discountPrice! &&
                                        productController.featuredProduct[index]
                                                .discountPrice !=
                                            0
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 40,
                          // color: Colors.red,
                          child: Text(
                            productController.featuredProduct[index].productName
                                .toString(),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        child: Text(
                          '${productController.featuredProduct[index].totalSell} Sold',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
