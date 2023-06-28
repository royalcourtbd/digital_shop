import 'dart:developer';

import 'package:digital_shop/general/utils/config.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'package:get/get.dart';

import '../../productDetailsPage/screen/product_details_page_view.dart';
import '../controller/product_controller.dart';
import '../model/products_model.dart';

class ProductsPageView extends GetView<ProductController> {
  final List<ProductModel> products;

  List<ProductModel>? searchList;

  final String? title;
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TypeAheadFormField(
                getImmediateSuggestions: true,
                hideSuggestionsOnKeyboardHide: true,
                hideOnEmpty: false,
                onSuggestionSelected: (ProductModel suggestion) {
                  controller.searchController.text =
                      suggestion.productName.toString();
                },
                itemBuilder: (context, ProductModel itemData) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () async {
                          searchList = products
                              .where((element) =>
                                  element.productName == itemData.productName)
                              .toList();

                          await Get.off(
                            () => ProductsPageView(
                              title: 'Searched Products',
                              products: searchList!,
                            ),
                          );
                        },
                        title: Text(itemData.productName.toString()),
                      ),
                      const Divider(),
                    ],
                  );
                },
                textFieldConfiguration: TextFieldConfiguration(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    //enabledBorder: InputBorder.none,
                    //focusedBorder: InputBorder.none,
                    hintStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    hoverColor: Colors.black,
                    prefixIcon: const Icon(Icons.search),
                    prefixIconColor: Theme.of(context).colorScheme.primary,
                    contentPadding: const EdgeInsets.only(top: 16),
                    hintText: 'Search Here...',
                  ),

                  controller: controller.searchController,
                  // style:
                  //     TextStyle(color: Theme.of(context).colorScheme.onPrimary),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) async {
                    log('object');
                    searchList = products
                        .where((element) => element.productName!
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();

                    await Get.to(
                      () => ProductsPageView(
                        title: 'Searched Products',
                        products: searchList!,
                      ),
                    );
                  },
                ),
                suggestionsCallback: (pattern) => products.where(
                  (element) {
                    if (element.productName!
                        .toLowerCase()
                        .contains(pattern.toLowerCase())) {
                      return element.productName!
                          .toLowerCase()
                          .contains(pattern.toLowerCase());
                    } else if (element.description!
                        .toLowerCase()
                        .contains(pattern.toLowerCase())) {
                      return element.description!
                          .toLowerCase()
                          .contains(pattern.toLowerCase());
                    } else {
                      return element.category!
                          .toLowerCase()
                          .contains(pattern.toLowerCase());
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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
                                          boxFit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 8),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: element.discountPrice! == 0
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
                                            width: element.price! >
                                                        element
                                                            .discountPrice! &&
                                                    element.discountPrice != 0
                                                ? 15
                                                : 0,
                                          ),
                                          Text(
                                            '${element.price}৳',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: element.price! >
                                                          element
                                                              .discountPrice! &&
                                                      element.discountPrice != 0
                                                  ? 14
                                                  : 18,
                                              color: element.price! >
                                                          element
                                                              .discountPrice! &&
                                                      element.discountPrice! !=
                                                          0
                                                  ? null
                                                  : Colors.red,
                                              fontWeight: element.price! >
                                                          element
                                                              .discountPrice! &&
                                                      element.discountPrice != 0
                                                  ? null
                                                  : FontWeight.bold,
                                              overflow: TextOverflow.ellipsis,
                                              decoration: element.price! >
                                                          element
                                                              .discountPrice! &&
                                                      element.discountPrice != 0
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
