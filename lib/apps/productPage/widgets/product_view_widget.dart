import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../controller/product_controller.dart';

class ProductViewWidget extends GetView<ProductController> {
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
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.productsList.value.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 1.29,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, index) {
            return Card(
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
                    height: Config.screenHeight! * .17,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                        //bottomRight: Radius.circular(4),
                      ),
                      child: Image.network(
                        controller.productsList.value[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 8),
                    child: Row(
                      children: [
                        Container(
                          child: controller.productsList.value[index]
                                      .discountPrice ==
                                  0
                              ? null
                              : Text(
                                  '${controller.productsList.value[index].discountPrice}৳',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Text(
                            '${controller.productsList.value[index].price}৳',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              decoration: double.parse(controller.productsList
                                              .value[index].price) >
                                          double.parse(controller.productsList
                                              .value[index].discountPrice) &&
                                      double.parse(
                                            controller.productsList.value[index]
                                                .discountPrice,
                                          ) !=
                                          0
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      controller.productsList.value[index].productName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Text(
                      '${controller.productsList.value[index].totalSell} Sold',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: InkWell(
                        onTap: () {
                          controller.deleteItem(
                            controller.productsList.value[index].id,
                          );
                        },
                        child: const Text('delete')),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
