import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:digital_shop/apps/productDetailsPage/widgets/cart_button.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:get/get.dart';
import '../../../general/constants/constants.dart';
import '../../../general/utils/config.dart';
import '../../productPage/model/products_model.dart';
import '../controller/product_details_page_controller.dart';
import '../widgets/details_text.dart';

class ProductDetailsPageView extends GetView<ProductDetailsPageController> {
  final ProductModel productValue;

  //CartModel cartModel;
  final ScrollController? scrollController = ScrollController();
  ProductDetailsPageView({
    Key? key,
    required this.productValue,
    // required this.cartModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      //extendBody: true,
      //appBar: AppBar(),
      body: SafeArea(
        //top: false,
        child: CustomScrollView(
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
                      color: Colors.grey.shade200,
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
                      color: Colors.grey.shade200,
                    ),
                    child: IconButton(
                      icon: Obx(
                        () => authController.user.value != null
                            ? Badge(
                                toAnimate: false,
                                ignorePointer: true,
                                alignment: Alignment.center,
                                badgeColor: Colors.green,
                                padding: const EdgeInsets.all(4),
                                position:
                                    BadgePosition.topEnd(top: -10, end: -9),
                                showBadge: cartPageController.cartLength > 0
                                    ? true
                                    : false,
                                badgeContent: Text(
                                  cartPageController.cartLength.toString(),
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
                              )
                            : const Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.black87,
                              ),
                      ),
                      onPressed: () {
                        Get.toNamed(RoutesClass.getCartPageRoute());
                        // mainPageController.currentIndex.value = 3;
                        // Get.toNamed(RoutesClass.getMainRoute());
                      },
                    ),
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
              expandedHeight: Config.screenHeight! / 2,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: CarouselSlider.builder(
                  slideIndicator: CircularSlideIndicator(
                    padding: const EdgeInsets.only(bottom: 15),
                  ),
                  slideTransform: const DefaultTransform(),
                  unlimitedMode: true,
                  // autoSliderTransitionTime: const Duration(seconds: 3),
                  enableAutoSlider: false,
                  itemCount: productValue.image!.length,
                  slideBuilder: (index) {
                    return FancyShimmerImage(
                      imageUrl: productValue.image![index],
                      boxFit: BoxFit.contain,
                      errorWidget: Image.asset('assets/images/loading.jpg'),
                    );
                  },
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
                                    productValue.discountPrice.toString(),
                                  ) ==
                                  0
                              ? null
                              : Text(
                                  '${productValue.discountPrice}৳',
                                  style: const TextStyle(
                                    fontSize: 29,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                        ),
                        SizedBox(
                          width: double.parse(
                                        productValue.price.toString(),
                                      ) >
                                      double.parse(
                                        productValue.discountPrice.toString(),
                                      ) &&
                                  double.parse(
                                        productValue.discountPrice.toString(),
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
                                          productValue.price.toString(),
                                        ) >
                                        double.parse(
                                          productValue.discountPrice.toString(),
                                        ) &&
                                    double.parse(
                                          productValue.discountPrice.toString(),
                                        ) !=
                                        0
                                ? 14
                                : 24,
                            color: double.parse(
                                          productValue.price.toString(),
                                        ) >
                                        double.parse(
                                          productValue.discountPrice.toString(),
                                        ) &&
                                    double.parse(
                                          productValue.discountPrice.toString(),
                                        ) !=
                                        0
                                ? Colors.grey.shade600
                                : Colors.red,
                            fontWeight: double.parse(
                                          productValue.price.toString(),
                                        ) >
                                        double.parse(
                                          productValue.discountPrice.toString(),
                                        ) &&
                                    double.parse(
                                          productValue.discountPrice.toString(),
                                        ) !=
                                        0
                                ? null
                                : FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                            decoration: double.parse(
                                          productValue.price.toString(),
                                        ) >
                                        double.parse(
                                          productValue.discountPrice.toString(),
                                        ) &&
                                    double.parse(
                                          productValue.discountPrice.toString(),
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
                                      productValue.price.toString(),
                                    ) >
                                    double.parse(
                                      productValue.discountPrice.toString(),
                                    ) &&
                                double.parse(
                                      productValue.discountPrice.toString(),
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
                                          productValue.discountPrice.toString(),
                                        ),
                                        double.parse(
                                          productValue.price.toString(),
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
                      productValue.productName.toString(),
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
                        Text(
                          'Rating ${productValue.rate!}*',
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
                    const SizedBox(
                      height: 5,
                    ),
                    DetailsText(title: 'Highlights'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      productValue.highlights!.replaceAll('•', '\n\n\u2022 '),
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.7,
                        color: Colors.black87,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    DetailsText(title: 'Description'),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      productValue.description.toString(),
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 15,
                        height: 1.5,
                        letterSpacing: 1,
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
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5.0),
        child: BottomAppBar(
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          child: Container(
            alignment: Alignment.center,
            height: Config.screenHeight! * .07,
            child: Row(
              children: [
                // Expanded(
                //   child: CartButton(
                //     onPressed: () {
                //       Fluttertoast.showToast(
                //         msg: "This is Center Short Toast",
                //         toastLength: Toast.LENGTH_SHORT,
                //         gravity: ToastGravity.BOTTOM,
                //         timeInSecForIosWeb: 1,
                //         backgroundColor: Colors.red,
                //         textColor: Colors.white,
                //         fontSize: 16.0,
                //       );
                //     },
                //     color: Colors.green,
                //     title: 'Buy Now',
                //   ),
                // ),
                Expanded(
                  child: CartButton(
                    onPressed: () {
                      authController.user.value != null
                          ? cartPageController.addProducToCart(productValue)
                          : ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Please Login First',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.red.shade100,
                              ),
                            );
                    },
                    color: Colors.red,
                    title: 'Add to Cart',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
