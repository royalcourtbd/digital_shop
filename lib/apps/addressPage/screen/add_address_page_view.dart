import 'package:digital_shop/apps/addressPage/controller/address_page_controller.dart';
import 'package:digital_shop/apps/addressPage/widgets/address_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../general/utils/config.dart';
import '../widgets/address_labe.dart';

class AddAddressPageView extends GetView<AddressPageController> {
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
          child: Column(
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
                hintText: 'Type Your Address',
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
                hintText: 'Type Your District',
                textEditingController: controller.districtController,
                validator: (value) {
                  return controller.districtValidation(value!);
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
                    AddressLabel(
                      title: 'Home',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AddressLabel(
                      title: 'Office',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AddressLabel(
                      title: 'Other',
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
                onPressed: () {
                  controller.saveAddressButton();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: Config.screenWidth! * 0.4,
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
    );
  }
}
