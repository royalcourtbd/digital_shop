import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../general/utils/config.dart';
import '../../productPage/controller/product_controller.dart';
import '../../productPage/model/products_model.dart';
import '../controller/product_details_page_controller.dart';
import '../widgets/cart_button.dart';

class ProductDetailsPageView extends GetView<ProductDetailsPageController> {
  CartPageController cartPageController = Get.put(CartPageController());
  ProductController productController = Get.put(ProductController());
  ProductModel productValue;
  ScrollController? scrollController = ScrollController();
  ProductDetailsPageView({Key? key, required this.productValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: CustomScrollView(
        // //physics: const NeverScrollableScrollPhysics(),
        //physics: const BouncingScrollPhysics(),
        controller: scrollController,
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade300,
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade300,
                  ),
                  child: IconButton(
                    icon: Obx(() => Badge(
                          toAnimate: false,
                          ignorePointer: true,
                          alignment: Alignment.center,
                          badgeColor: Colors.green,
                          padding: const EdgeInsets.all(3),
                          position: BadgePosition.topEnd(top: -8, end: -5),
                          showBadge:
                              cartPageController.cartLength > 0 ? true : false,
                          badgeContent: Text(
                            cartPageController.cartItemList.value.length
                                .toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.black87,
                          ),
                        )),
                    onPressed: () {
                      Get.toNamed(RoutesClass.getCartPageRoute());
                    },
                  ),
                ),
              ],
            ),
            automaticallyImplyLeading: false,
            expandedHeight: Config.screenHeight! / 2.7,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                productValue.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        child: double.parse(
                                  productValue.discountPrice,
                                ) ==
                                0
                            ? null
                            : Text(
                                '${productValue.discountPrice}৳',
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                      ),
                      SizedBox(
                        width: double.parse(
                                      productValue.price,
                                    ) >
                                    double.parse(
                                      productValue.discountPrice,
                                    ) &&
                                double.parse(
                                      productValue.discountPrice,
                                    ) !=
                                    0
                            ? 10
                            : 0,
                      ),
                      Text(
                        '${productValue.price}৳',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: double.parse(
                                        productValue.price,
                                      ) >
                                      double.parse(
                                        productValue.discountPrice,
                                      ) &&
                                  double.parse(
                                        productValue.discountPrice,
                                      ) !=
                                      0
                              ? 14
                              : 24,
                          color: double.parse(
                                        productValue.price,
                                      ) >
                                      double.parse(
                                        productValue.discountPrice,
                                      ) &&
                                  double.parse(
                                        productValue.discountPrice,
                                      ) !=
                                      0
                              ? Colors.grey.shade600
                              : Colors.red,
                          fontWeight: double.parse(
                                        productValue.price,
                                      ) >
                                      double.parse(
                                        productValue.discountPrice,
                                      ) &&
                                  double.parse(
                                        productValue.discountPrice,
                                      ) !=
                                      0
                              ? null
                              : FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          decoration: double.parse(
                                        productValue.price,
                                      ) >
                                      double.parse(
                                        productValue.discountPrice,
                                      ) &&
                                  double.parse(
                                        productValue.discountPrice,
                                      ) !=
                                      0
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      double.parse(
                                    productValue.price,
                                  ) >
                                  double.parse(
                                    productValue.discountPrice,
                                  ) &&
                              double.parse(
                                    productValue.discountPrice,
                                  ) !=
                                  0
                          ? Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 1),
                              decoration: BoxDecoration(
                                  color: Colors.red.shade100,
                                  borderRadius: BorderRadius.circular(2)),
                              child: AutoSizeText(
                                '-${productController.calculatePercentage(
                                      double.parse(
                                        productValue.discountPrice,
                                      ),
                                      double.parse(
                                        productValue.price,
                                      ),
                                    ).round()}%',
                                style: TextStyle(
                                  color: Colors.red.shade800,
                                  fontSize: 10,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Text(
                    productValue.productName,
                    style: const TextStyle(
                      height: 1.1,
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Rating  4.5*',
                      ),
                      const SizedBox(
                        height: 25,
                        child: VerticalDivider(
                          color: Colors.grey,
                          //thickness: 1,
                          indent: 5,
                          endIndent: 5,
                          width: 15,
                        ),
                      ),
                      Text(
                        '${productValue.totalSell} orders',
                      ),
                    ],
                  ),
                  const Divider(),
                  AutoSizeText(
                    'Highlights',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Text(
                    productValue.highlights!.replaceAll('•', '\n\u2022 '),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      height: 1.3,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  AutoSizeText(
                    'Description',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    productValue.discription.replaceAll('', ''),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          alignment: Alignment.center,
          height: Config.screenHeight! * 0.07,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: Config.screenHeight! * 0.06,
                  width: Config.screenHeight! * 0.06,
                  //color: Colors.grey,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                    ),
                  ),
                ),
              ),
              Expanded(
                //flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  //color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          cartPageController.addToCart(productValue);
                          Get.snackbar(
                            '',
                            'Successfully added to cart',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black.withOpacity(0.2),
                          );
                        },
                        child: CartButton(
                          color: Colors.green,
                          title: 'Add to Cart',
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                      ),
                      CartButton(
                        color: Colors.red,
                        title: 'Buy Now',
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
