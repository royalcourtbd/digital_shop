import 'dart:developer';

import 'package:digital_shop/apps/cartPage/widgets/body_view.dart';
import 'package:digital_shop/apps/checkoutPage/controller/checkout_page_controller.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../general/constants/constants.dart';
import '../widgets/order_summary_row.dart';

class CheckoutPageView extends GetView<CheckoutPageController> {
  const CheckoutPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Obx(
              () => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addressPageController.addressLength.isEqual(0)
                      ? Card(
                          child: ListTile(
                            onTap: () {
                              Get.toNamed(RoutesClass.getAddressPageRoute());
                            },
                            minLeadingWidth: 30,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            leading: const Icon(
                              IconlyLight.location,
                              size: 28,
                            ),
                            horizontalTitleGap: 0,
                            title: Text(
                              'Add New Address',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        )
                      : Card(
                          child: ListTile(
                            onTap: () {
                              log(addressPageController.getAddress.toString());
                            },
                            minLeadingWidth: 30,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            leading: const Icon(
                              IconlyLight.location,
                              size: 28,
                            ),
                            horizontalTitleGap: 0,
                            title: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                addressPageController.getNameNumber!
                                    .toUpperCase(),
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    addressPageController.getAddress!,
                                  ),
                                  Text(
                                    auth.currentUser!.email!,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: Config.screenHeight! * 0.01),
                  Card(
                    child: ListTile(
                      onTap: () {
                        log(controller.deliveryAddress.toString());
                      },
                      minLeadingWidth: 32,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      leading: const Icon(
                        Icons.payments,
                        size: 28,
                      ),
                      horizontalTitleGap: 0,
                      title: Text(
                        'Select Payment Method',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      trailing: const Icon(IconlyLight.arrow_right_2),
                    ),
                  ),
                  SizedBox(height: Config.screenHeight! * 0.02),
                  Card(
                    //margin: EdgeInsets.zero,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Info',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        const BodyView(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Obx(
                    () => controller.charge.value != null
                        ? Card(
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order Summary',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Obx(
                                    () => OrderSummaryRow(
                                      title: 'Total Cost',
                                      value: cartPageController.totalPrice
                                          .round()
                                          .toString(),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Obx(
                                    () => OrderSummaryRow(
                                      title:
                                          'Promotion (${controller.charge.value!.discount}) %',
                                      value:
                                          '- ${controller.getDiscountAmount(cartPageController.totalPrice)!.round()}',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Obx(
                                    () => OrderSummaryRow(
                                      title:
                                          'Vat (${controller.charge.value!.vat}) %',
                                      value:
                                          '+ ${controller.getVatAmount(cartPageController.totalPrice)!.round()}',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Obx(
                                    () => OrderSummaryRow(
                                      title: 'Delivery Fee',
                                      value: cartPageController
                                              .cartItemList.isNotEmpty
                                          ? controller
                                              .charge.value!.deliveryFee!
                                              .round()
                                              .toString()
                                          : '0',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Obx(
                                    () => OrderSummaryRow(
                                      title: 'Total Payment',
                                      value: cartPageController
                                              .cartItemList.isNotEmpty
                                          ? controller
                                              .getGrandTotal(
                                                  cartPageController.totalPrice)
                                              .round()!
                                              .toString()
                                          : '0',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => controller.charge.value != null
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: Config.screenHeight! * .085,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Obx(
                          () => Text(
                            cartPageController.cartItemList.isNotEmpty
                                ? 'Total : ${controller.getGrandTotal(cartPageController.totalPrice)!.round()} ৳'
                                : 'Total : 0 ৳',
                            //'Total : ${controller.getGrandTotal(cartPageController.totalPrice)} ৳',
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text('Vat included, where aplicable'),
                      ],
                    ),
                    Obx(
                      () => cartPageController.cartItemList.isNotEmpty
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(
                                  Config.screenWidth! * .4,
                                  Config.screenHeight! * 0.06,
                                ),
                              ),
                              onPressed: () {
                                controller.checkoutProduct(
                                  productController.productsList,
                                  cartPageController.cartItemList,
                                );
                              },
                              child: const Text(
                                'Place Order',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
