import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/apps/addressPage/widgets/home_and_edit_button_widget.dart';
import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/address_page_controller.dart';

class AddressViewWidget extends StatelessWidget {
  const AddressViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return GetX(
      init: AddressPageController(),
      builder: <AddressPageController>(controller) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: controller.addressLength,
          itemBuilder: (context, index) {
            final test = controller.addressList[index].address +
                ', ' +
                controller.addressList[index].thana +
                ', ' +
                controller.addressList[index].division +
                ', ' +
                controller.addressList[index].zip;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  height: 135,
                  child: Row(
                    children: [
                      Container(
                        //padding: const EdgeInsets.all(5),
                        alignment: Alignment.topCenter,
                        width: 50,
                        decoration: const BoxDecoration(
                          //color: Colors.black,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(4),
                          ),
                        ),
                        child: const Icon(
                          Icons.place_outlined,
                          size: 30,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 5, right: 30),
                          alignment: Alignment.topLeft,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(4),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.addressList[index].name
                                        .toUpperCase() +
                                    ', ' +
                                    controller.addressList[index].number,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const Divider(),
                              AutoSizeText(
                                test,
                                //'Vogra Bypass More, Gazipur Sadar, Post : Nationnal University Gazipur, Dhaka, bangladesh, 1711',
                                style: const TextStyle(
                                  //fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  HomeAndEditButtonWidget(
                                    title: controller.addressList[index].label,
                                    bgColor: Colors.white,
                                    height: Config.screenHeight! * 0.03,
                                    width: Config.screenWidth! * 0.18,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      //
                                    },
                                    child: HomeAndEditButtonWidget(
                                      title: 'Edit',
                                      fontColor: Colors.white,
                                      height: Config.screenHeight! * 0.03,
                                      width: Config.screenWidth! * 0.18,
                                    ),
                                  ),
                                ],
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
          },
        );
      },
    );
  }
}
