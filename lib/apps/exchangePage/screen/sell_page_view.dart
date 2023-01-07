import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/exchangePage/controller/sell_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/widgets/dollar_method_icon.dart';
import 'package:digital_shop/apps/exchangePage/widgets/info_title.dart';
import 'package:digital_shop/apps/exchangePage/widgets/text_field_for_sell_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../model/bdt_product_model.dart';
import '../model/send_usd_model.dart';
import '../widgets/material_button_widget.dart';

class SellPageView extends GetView<SellPageController> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sell Dollar'),
        //automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      // drawer: const DrawerForExchangePage(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoTitle(title: 'Send Method'),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.green,
                    ),
                  ),
                  child: Row(
                    children: [
                      SellMethodUSDIcon(),
                      Obx(
                        () => Container(
                          width: Config.screenWidth! - 82,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            isExpanded: true,
                            hint: Text(controller.titleUsd.value.toString()),
                            items: controller.sellUsdItem.map((SendUsdModel e) {
                              return DropdownMenuItem(
                                value: e.dollarName,
                                child: Text(e.dollarName!),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.titleUsd.value = value.toString();
                              controller.indexUsd.value =
                                  controller.sellUsdItem.indexWhere(
                                (element) => element.dollarName == value,
                              );
                              controller.imageUsd.value = controller
                                  .sellUsdItem[controller.indexUsd.value]
                                  .dollarIcon!;

                              controller.calculatAmount.value = double.parse(
                                controller
                                    .sellUsdItem[controller.indexUsd.value]
                                    .currentPrice!,
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              InfoTitle(
                title: 'Receive Method',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  // vertical: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.green,
                    ),
                  ),
                  height: 50,
                  child: Row(
                    children: [
                      SellMethodBDTIcon(),
                      Obx(
                        () => Container(
                          width: Config.screenWidth! - 82,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            isExpanded: true,
                            hint: Text(controller.titleBdt.value.toString()),
                            items: controller.sellBDTItem
                                .map((BdtProductsModel e) {
                              return DropdownMenuItem(
                                value: e.bdBankName,
                                child: Text(e.bdBankName!),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.titleBdt.value = value.toString();
                              controller.indexBdt.value =
                                  controller.sellBDTItem.indexWhere(
                                (element) => element.bdBankName == value,
                              );

                              controller.imageBdt.value = controller
                                  .sellBDTItem[controller.indexBdt.value]
                                  .bdBankIcon!;

                              print(controller.imageBdt.value);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InfoTitle(
                title: 'Send Amount (\$)',
              ),
              TextFieldForSell(
                autofocus: true,
                textEditingController: controller.sendAmountController,
                textInputType: TextInputType.number,
                focusNode: controller.myFocusNode,
                hintText: '0',
                maxLength:
                    controller.titleUsd.value == 'Please select a item' ? 1 : 6,
                onChanged: (String value) {
                  controller.valueTest.value = double.parse(value);
                  controller.add(
                    double.parse(value),
                    double.parse(
                      controller.calculatAmount.value.toString(),
                    ),
                  );
                },
                validator: ((value) {
                  return controller.validateAmount(value!);
                }),
                onSaved: (value) {},
              ),
              InfoTitle(
                title: 'Receive Amount (৳)',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    border: Border.all(
                      width: 1,
                      color: Colors.green,
                    ),
                  ),
                  height: 50,
                  width: Config.screenWidth! - 30,
                  child: Obx(
                    () => AutoSizeText(
                      double.parse(
                              controller.receiveAmount.value.round().toString())
                          .toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoTitle(
                      title: controller.titleBdt.value == 'Please select a item'
                          ? 'Number'
                          : '${controller.titleBdt.value} Number',
                    ),
                    //send Money , Number Text Field
                    TextFieldForSell(
                      textInputType: TextInputType.number,
                      hintText: '017',
                      textEditingController: controller.sendNumberController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        return controller.validateSendAmountNumber(value!);
                      },
                      maxLength:
                          controller.titleBdt.value == 'Please select a item'
                              ? 1
                              : controller.titleBdt.value == 'Rocket'
                                  ? 12
                                  : 11,
                    ),
                    InfoTitle(
                      title: controller.titleUsd.value == 'Please select a item'
                          ? 'Email'
                          : '${controller.titleUsd.value} Email',
                    ),
                    //TransectionID Text Field
                    TextFieldForSell(
                      textEditingController: controller.sendEmailController,
                      hintText: '@',
                      textInputType: TextInputType.emailAddress,
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                      //maxLines: 5,
                    ),
                    InfoTitle(
                      title: 'Contact Number',
                    ),
                    TextFieldForSell(
                      textInputType: TextInputType.number,
                      hintText: '017',
                      textEditingController:
                          controller.sendContactNumberController,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: (value) {
                        return controller.validateContactNumber(value!);
                      },
                      maxLength: 11,
                    ),
                    InfoTitle(
                      title: 'Note',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.green,
                          ),
                        ),
                        // height: 50,
                        child: TextFormField(
                          controller: controller.sendNoteController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          decoration: const InputDecoration(
                            hintText: ' abc.toString()',
                            counterText: '',
                            focusColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          maxLength: 89,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    InfoTitle(title: ''),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          border: Border.all(
                            width: 1,
                            color: Colors.green,
                          ),
                        ),
                        height: 55,
                        width: Config.screenWidth! - 30,
                        child: Obx(
                          () => AutoSizeText(
                            controller.paymentNotice.value.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButtonWidget(
                            onPressed: () {
                              controller.sellSubmitButton();
                            },
                            minWidth: 120,
                            text: 'Submit',
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          MaterialButtonWidget(
                            onPressed: () {
                              controller.cancelButton();
                            },
                            text: 'Cancel',
                            backgroundColor: Colors.red.shade300,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: mainPageController.isAdLoaded
      //     ? SizedBox(
      //         height: mainPageController.bannerAd.size.height.toDouble(),
      //         width: mainPageController.bannerAd.size.width.toDouble(),
      //         child: AdWidget(ad: mainPageController.bannerAd),
      //       )
      //     : const SizedBox(),
    );
  }
}
