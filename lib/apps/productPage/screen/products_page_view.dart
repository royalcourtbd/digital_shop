import 'package:digital_shop/general/utils/config.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../productDetailsPage/screen/product_details_page_view.dart';
import '../controller/product_controller.dart';
import '../model/products_model.dart';

class ProductsPageView extends GetView<ProductController> {
  List<ProductModel> products;
  String? title;
  ProductsPageView({Key? key, required this.products, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title.toString()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Obx(
              () => products.isNotEmpty
                  ? GridView(
                      padding: const EdgeInsets.only(bottom: 5),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        //delete button remove korar por aita enabled korbo
                        childAspectRatio: 1 / 1.45,

                        ///childAspectRatio: 1 / 1.4,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                      ),
                      children: products
                          .map(
                            (element) => InkWell(
                              onTap: () {
                                Get.to(
                                  () => ProductDetailsPageView(
                                    productValue: element,
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
                                      height: Config.screenHeight! * .2,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4),
                                          //bottomRight: Radius.circular(4),
                                        ),
                                        child: FancyShimmerImage(
                                          errorWidget: Image.asset(
                                              'assets/images/loading.jpg'),
                                          imageUrl: element.image![0],
                                          width: double.infinity,
                                          height: Config.screenHeight! * 2,
                                          boxFit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 8),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: double.parse(
                                                      element.discountPrice!,
                                                    ) ==
                                                    0
                                                ? null
                                                : Text(
                                                    '${element.discountPrice}৳',
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                          ),
                                          SizedBox(
                                            width: double.parse(
                                                          element.price
                                                              .toString(),
                                                        ) >
                                                        double.parse(
                                                          element.discountPrice
                                                              .toString(),
                                                        ) &&
                                                    double.parse(
                                                          element.discountPrice
                                                              .toString(),
                                                        ) !=
                                                        0
                                                ? 15
                                                : 0,
                                          ),
                                          Text(
                                            '${element.price}৳',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: double.parse(
                                                            element.price
                                                                .toString(),
                                                          ) >
                                                          double.parse(
                                                            element
                                                                .discountPrice
                                                                .toString(),
                                                          ) &&
                                                      double.parse(
                                                            element
                                                                .discountPrice
                                                                .toString(),
                                                          ) !=
                                                          0
                                                  ? 14
                                                  : 18,
                                              color: double.parse(
                                                            element.price
                                                                .toString(),
                                                          ) >
                                                          double.parse(
                                                            element
                                                                .discountPrice
                                                                .toString(),
                                                          ) &&
                                                      double.parse(
                                                            element
                                                                .discountPrice
                                                                .toString(),
                                                          ) !=
                                                          0
                                                  ? null
                                                  : Colors.red,
                                              fontWeight: double.parse(
                                                            element.price
                                                                .toString(),
                                                          ) >
                                                          double.parse(
                                                            element
                                                                .discountPrice
                                                                .toString(),
                                                          ) &&
                                                      double.parse(
                                                            element
                                                                .discountPrice
                                                                .toString(),
                                                          ) !=
                                                          0
                                                  ? null
                                                  : FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                              decoration: double.parse(
                                                            element.price
                                                                .toString(),
                                                          ) >
                                                          double.parse(
                                                            element
                                                                .discountPrice
                                                                .toString(),
                                                          ) &&
                                                      double.parse(
                                                            element
                                                                .discountPrice
                                                                .toString(),
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        height: 40,
                                        // color: Colors.red,
                                        child: Text(
                                          element.productName!,
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
                                        '${element.totalSell} sold',
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
                          )
                          .toList(),
                    )
                  : const Text('NO products'),
            )
          ],
        ),
      ),
    );
  }
}
