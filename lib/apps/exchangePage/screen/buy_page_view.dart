import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/exchangePage/controller/buy_page_controller.dart';
import 'package:digital_shop/apps/exchangePage/widgets/info_title.dart';
import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BuyPageView extends GetView<BuyPageController> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    //Config().init(context);
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Dollar'),
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoTitle(
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
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.all(3),
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white30,
                          border: Border(
                              right: BorderSide(
                            color: Colors.green,
                            width: 1,
                          )),
                        ),
                        child: controller.buySelected.value == 'bKash'
                            ? Image.asset(
                                'assets/currency/bkash.png',
                                fit: BoxFit.cover,
                              )
                            : controller.buySelected.value == 'Nagad'
                                ? Image.asset(
                                    'assets/currency/nagad.png',
                                    fit: BoxFit.cover,
                                  )
                                : controller.buySelected.value == 'Rocket'
                                    ? Image.asset(
                                        'assets/currency/rocket.png',
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/currency/bank.png',
                                        fit: BoxFit.cover,
                                      ),
                      ),
                    ),
                    Obx(
                      () => Container(
                        width: Config.screenWidth! - 82,
                        //decoration: BoxDecoration(color: Colors.grey),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          isExpanded: true,
                          hint: const Text('please select a item'),
                          onChanged: (value) {
                            controller.setBuySelected(value);
                          },
                          value: controller.buySelected.value,
                          items: controller.buyMethodList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
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
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.all(3),
                        alignment: Alignment.center,
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: Colors.white30,
                          border: Border(
                              right: BorderSide(
                            color: Colors.green,
                            width: 1,
                          )),
                        ),
                        child: controller.sellSelected.value == 'Bitcoin'
                            ? Image.asset(
                                'assets/currency/bitcoin.png',
                                fit: BoxFit.cover,
                              )
                            : controller.sellSelected.value == 'Litecoin'
                                ? Image.asset(
                                    'assets/currency/litecoin.png',
                                    fit: BoxFit.cover,
                                  )
                                : controller.sellSelected.value == 'Neteller'
                                    ? Image.asset(
                                        'assets/currency/neteller.png',
                                        fit: BoxFit.cover,
                                      )
                                    : Image.asset(
                                        'assets/currency/bank.png',
                                        fit: BoxFit.cover,
                                      ),
                      ),
                    ),
                    Obx(
                      () => Container(
                        width: Config.screenWidth! - 82,
                        //decoration: BoxDecoration(color: Colors.grey),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: DropdownButton(
                          underline: const SizedBox(),
                          isExpanded: true,
                          hint: const Text('please select a item'),
                          onChanged: (value) {
                            controller.setSellSelected(value);
                          },
                          value: controller.sellSelected.value,
                          items: controller.sellMethodList.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InfoTitle(
              title: 'Send Amount (৳)',
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
                height: 50,
                child: TextFormField(
                  controller: controller.sendAmountController,
                  keyboardType: TextInputType.number,
                  focusNode: FocusNode(canRequestFocus: false),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    hintText: 0.toString(),
                    counterText: '',
                    focusColor: Colors.white,
                    border: InputBorder.none,
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide:
                    //       BorderSide(color: Color(0xff8D142DFF), width: 1),
                    //   //borderRadius: BorderRadius.circular(8),
                    // ),
                  ),
                  onChanged: (String value) {
                    var s = controller.receiveAmount.value = value;
                  },
                  maxLength: 5,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            InfoTitle(
              title: 'Receive Amount (\$)',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.green,
                  ),
                ),
                height: 50,
                width: Config.screenWidth! - 30,
                child: Obx(
                  () => AutoSizeText(
                    '${controller.receiveAmount.value}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // Row(
            //   children: [
            //     Container(
            //       color: Colors.red,
            //       height: 50,
            //       width: 50,
            //     ),
            //     Container(
            //       height: Config.screenHeight! * .06,
            //       width: Config.screenWidth! - 50,
            //       color: Colors.cyan,
            //       child: DropdownButton(
            //         onChanged: (value) {
            //           controller.setSelected(value);
            //         },
            //         value: controller.selected.value,
            //         isExpanded: true,
            //         items: controller.itemList.map((e) {
            //           return DropdownMenuItem(
            //             child: Text(e),
            //             value: e,
            //           );
            //         }).toList(),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
