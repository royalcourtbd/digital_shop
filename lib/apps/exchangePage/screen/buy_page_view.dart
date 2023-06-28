import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/exchangePage/controller/buy_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/model/send_usd_model.dart';
import 'package:digital_shop/apps/exchangePage/widgets/info_title.dart';
import 'package:digital_shop/apps/exchangePage/widgets/material_button_widget.dart';
import 'package:digital_shop/apps/exchangePage/widgets/text_field_widget.dart';
import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/bdt_product_model.dart';
import '../model/received_usd_model.dart';
import '../widgets/dollar_method_icon.dart';

class BuyPageView extends GetView<BuyPageController> {
  const BuyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Dollar'),
        //automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      //drawer: const DrawerForExchangePage(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        physics: const BouncingScrollPhysics(),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoTitle(
                title: 'Send Method',
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
                      const BuyMethodBDTIcon(),
                      Obx(
                        () => Container(
                          width: Config.screenWidth! - 82,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            isExpanded: true,
                            hint: Text(controller.titleBdt.value.toString()),
                            items: controller.bdProductsList
                                .map((BdtProductsModel e) {
                              return DropdownMenuItem(
                                value: e.bdBankName,
                                child: Text(e.bdBankName!),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.titleBdt.value = value.toString();
                              controller.indexBdt.value =
                                  controller.bdProductsList.indexWhere(
                                (element) => element.bdBankName == value,
                              );

                              controller.imageBdt.value = controller
                                  .bdProductsList[controller.indexBdt.value]
                                  .bdBankIcon!;

                              value == 'bkash'
                                  ? controller.isBkash.value = false
                                  : controller.isBkash.value = true;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const InfoTitle(
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
                      const BuyMethodUSDIcon(),
                      Obx(
                        () => Container(
                          width: Config.screenWidth! - 82,
                          //decoration: BoxDecoration(color: Colors.grey),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: DropdownButton(
                            underline: const SizedBox(),
                            isExpanded: true,
                            hint: Text(controller.titleUsd.value.toString()),
                            items: controller.buyItemUSDList
                                .map((ReceivedUsdModel e) {
                              return DropdownMenuItem(
                                value: e.dollarName,
                                child: Text(e.dollarName),
                              );
                            }).toList(),
                            onChanged: (value) {
                              controller.titleUsd.value = value.toString();
                              controller.indexUsd.value =
                                  controller.buyItemUSDList.indexWhere(
                                (element) => element.dollarName == value,
                              );
                              controller.imageUsd.value = controller
                                  .buyItemUSDList[controller.indexUsd.value]
                                  .dollarIcon;

                              controller.calculatAmount.value = double.parse(
                                controller
                                    .buyItemUSDList[controller.indexUsd.value]
                                    .currentPrice,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const InfoTitle(
                title: 'Receive Amount (\$)',
              ),
              TextFieldWidget(
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
                validator: (value) {
                  return controller.validateAmount(value!);
                },
                onSaved: (value) {},
              ),

              const InfoTitle(
                title: 'Send Amount (৳)',
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
                          controller.receiveAmount.value.round().toString(),
                        ).toString(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ),

              Obx(
                () => Visibility(
                  visible: controller.isBkash.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoTitle(
                        title:
                            controller.titleBdt.value == 'Please select a item'
                                ? 'Number'
                                : '${controller.titleBdt.value} Number',
                      ),
                      //send Money , Number Text Field
                      TextFieldWidget(
                        textInputType: TextInputType.number,
                        hintText: '017',
                        textEditingController: controller.sendNumberController,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        maxLength:
                            controller.titleBdt.value == 'Please select a item'
                                ? 1
                                : controller.titleBdt.value == 'Rocket'
                                    ? 12
                                    : 11,
                        validator: (value) {
                          return controller.validateSendAmountNumber(value!);
                        },
                      ),
                      InfoTitle(
                        title:
                            controller.titleBdt.value == 'Please select a item'
                                ? 'Trx id'
                                : '${controller.titleBdt.value} Trx id',
                      ),
                      //TransectionID Text Field
                      TextFieldWidget(
                        textInputType: TextInputType.text,
                        hintText: '0',
                        textEditingController: controller.sendTrxIdController,
                        maxLength: 22,
                        validator: (value) {
                          return controller.validateTrxID(value!);
                        },
                      ),
                    ],
                  ),
                ),
              ),

              Obx(
                () => InfoTitle(
                  title: controller.titleUsd.value == 'Please select a item'
                      ? 'Email'
                      : '${controller.titleUsd.value} Email',
                ),
              ),
              //Email Text Field
              TextFieldWidget(
                textEditingController: controller.sendEmailController,
                hintText: 'Coinbase Email',
                textInputType: TextInputType.emailAddress,
                validator: (value) {
                  return controller.validateEmail(value!);
                },

                //maxLines: 5,
              ),
              const InfoTitle(
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
              const InfoTitle(title: ''),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(
                      () => MaterialButtonWidget(
                        onPressed: () {
                          controller.buySubmit(
                              BdtProductsModel(), SendUsdModel());
                        },
                        minWidth: 120,
                        text: controller.titleBdt.value == 'bkash'
                            ? 'Pay Now'
                            : 'Submit',
                      ),
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
      ),
    );
  }
}
