import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_image/shimmer_image.dart';

import '../../../general/utils/config.dart';
import '../../productDetailsPage/screen/product_details_page_view.dart';
import '../controller/product_controller.dart';

class ProductViewWidget extends GetView<ProductController> {
  //ProductModel? productModel;

  const ProductViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return GetX(
      init: ProductController(),
      builder: <ProductController>(controller) {
        return GridView.builder(
          padding: const EdgeInsets.only(bottom: 5),
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.productsList.value.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //delete button remove korar por aita enabled korbo
            childAspectRatio: 1 / 1.25,

            ///childAspectRatio: 1 / 1.4,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(
                  () => ProductDetailsPageView(
                    productValue: controller.productsList.value[index],
                  ),
                );
              },
              child: Card(
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
                      height: Config.screenHeight! * .16,
                      child: Obx(
                        () => ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(4),
                            //bottomRight: Radius.circular(4),
                          ),
                          child: Hero(
                            tag: controller.productsList.value[index].productId,
                            child: ProgressiveImage(
                              imageError: 'assets/images/loading.jpg',
                              image: controller.productsList.value[index].image,
                              width: double.infinity,
                              height: Config.screenHeight! * .16,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 8),
                      child: Row(
                        children: [
                          Container(
                            child: double.parse(
                                      controller.productsList.value[index]
                                          .discountPrice,
                                    ) ==
                                    0
                                ? null
                                : Text(
                                    '${controller.productsList.value[index].discountPrice}৳',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                          ),
                          SizedBox(
                            width: double.parse(
                                          controller
                                              .productsList.value[index].price,
                                        ) >
                                        double.parse(
                                          controller.productsList.value[index]
                                              .discountPrice,
                                        ) &&
                                    double.parse(
                                          controller.productsList.value[index]
                                              .discountPrice,
                                        ) !=
                                        0
                                ? 15
                                : 0,
                          ),
                          Text(
                            '${controller.productsList.value[index].price}৳',
                            style: TextStyle(
                              fontSize: double.parse(
                                            controller.productsList.value[index]
                                                .price,
                                          ) >
                                          double.parse(
                                            controller.productsList.value[index]
                                                .discountPrice,
                                          ) &&
                                      double.parse(
                                            controller.productsList.value[index]
                                                .discountPrice,
                                          ) !=
                                          0
                                  ? 14
                                  : 16,
                              color: double.parse(
                                            controller.productsList.value[index]
                                                .price,
                                          ) >
                                          double.parse(
                                            controller.productsList.value[index]
                                                .discountPrice,
                                          ) &&
                                      double.parse(
                                            controller.productsList.value[index]
                                                .discountPrice,
                                          ) !=
                                          0
                                  ? null
                                  : Colors.red,
                              fontWeight: double.parse(
                                            controller.productsList.value[index]
                                                .price,
                                          ) >
                                          double.parse(
                                            controller.productsList.value[index]
                                                .discountPrice,
                                          ) &&
                                      double.parse(
                                            controller.productsList.value[index]
                                                .discountPrice,
                                          ) !=
                                          0
                                  ? null
                                  : FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              decoration: double.parse(
                                            controller.productsList.value[index]
                                                .price,
                                          ) >
                                          double.parse(
                                            controller.productsList.value[index]
                                                .discountPrice,
                                          ) &&
                                      double.parse(
                                            controller.productsList.value[index]
                                                .discountPrice,
                                          ) !=
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
                          controller.productsList.value[index].productName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 6),
                      child: Text(
                        '${controller.productsList.value[index].totalSell} sold',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
