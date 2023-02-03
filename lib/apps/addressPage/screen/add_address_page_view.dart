import 'package:digital_shop/apps/addressPage/controller/address_page_controller.dart';
import 'package:digital_shop/apps/addressPage/widgets/address_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../widgets/address_labe.dart';

class AddAddressPageView extends GetView<AddressPageController> {
  const AddAddressPageView({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add shipping address'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.addressFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AddressTextField(
                  hintText: 'Type Your Name',
                  textEditingController: controller.nameController,
                  validator: (value) {
                    return controller.nameValidation(value!);
                  },
                ),
                AddressTextField(
                  hintText: 'Type Your Number',
                  textEditingController: controller.numberController,
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  validator: (value) {
                    return controller.numberValidation(value!);
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                AddressTextField(
                  hintText: 'House no/ building/ area',
                  textEditingController: controller.addressController,
                  validator: (value) {
                    return controller.addressValidation(value!);
                  },
                ),
                AddressTextField(
                  hintText: 'Type Your Division',
                  textEditingController: controller.divisionController,
                ),
                AddressTextField(
                  hintText: 'Type Your Thana',
                  textEditingController: controller.thanaController,
                  validator: (value) {
                    return controller.thanaValidation(value!);
                  },
                ),
                AddressTextField(
                  hintText: 'Type Your Zip',
                  textEditingController: controller.zipCodeController,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Obx(
                        () => Expanded(
                          child: AddressLabel(
                            title: 'Home',
                            onTap: () {
                              controller.selectLabel.value = 'Home';
                            },
                            borderColor: controller.selectLabel.value == 'Home'
                                ? Colors.green
                                : Colors.black,
                            backgroundColor:
                                controller.selectLabel.value == 'Home'
                                    ? Colors.green
                                    : Colors.white,
                            textColor: controller.selectLabel.value == 'Home'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Expanded(
                          child: AddressLabel(
                            title: 'Office',
                            onTap: () {
                              controller.selectLabel.value = 'Office';
                            },
                            borderColor:
                                controller.selectLabel.value == 'Office'
                                    ? Colors.green
                                    : Colors.black,
                            backgroundColor:
                                controller.selectLabel.value == 'Office'
                                    ? Colors.green
                                    : Colors.white,
                            textColor: controller.selectLabel.value == 'Office'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Obx(
                        () => Expanded(
                          child: AddressLabel(
                            title: 'Other',
                            onTap: () {
                              controller.selectLabel.value = 'Other';
                            },
                            borderColor: controller.selectLabel.value == 'Other'
                                ? Colors.green
                                : Colors.black,
                            backgroundColor:
                                controller.selectLabel.value == 'Other'
                                    ? Colors.green
                                    : Colors.white,
                            textColor: controller.selectLabel.value == 'Other'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    controller.saveAddressButton();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: Config.screenWidth! * 0.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(0, 20, 194, 43),
                          Color.fromARGB(0, 123, 13, 145)
                        ],
                      ),
                    ),
                    child: const Text(
                      'Save Address',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
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
