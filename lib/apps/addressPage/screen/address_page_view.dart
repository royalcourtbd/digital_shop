import 'package:digital_shop/general/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../general/utils/config.dart';
import '../controller/address_page_controller.dart';
import '../widgets/home_and_edit_button_widget.dart';

class AddressPageView extends GetView<AddressPageController> {
  const AddressPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shipping Address'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: InkWell(
                onTap: () {
                  Get.toNamed(RoutesClass.getAddAddressPageRoute());
                },
                child: HomeAndEditButtonWidget(
                  title: 'Add Address',
                  fontColor: Colors.white,
                  fontSize: 16,
                  height: Config.screenHeight! * 0.05,
                  width: Config.screenWidth! * 0.8,
                ),
              ),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: SizedBox(
                      height: 150,
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
                              padding:
                                  const EdgeInsets.only(left: 5, right: 30),
                              alignment: Alignment.topLeft,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(4),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'MD ABU SAYED, +880-1749247855',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Divider(),
                                  const Text(
                                    'Vogra Bypass More, Gazipur Sadar, Post : Nationnal University Gazipur, Dhaka, bangladesh, 1711',
                                    style: TextStyle(
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
                                        title: 'Home',
                                        bgColor: Colors.white,
                                        height: Config.screenHeight! * 0.025,
                                        width: Config.screenWidth! * 0.15,
                                      ),
                                      HomeAndEditButtonWidget(
                                        title: 'Edit',
                                        fontColor: Colors.white,
                                        height: Config.screenHeight! * 0.025,
                                        width: Config.screenWidth! * 0.15,
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
            ),
          ],
        ),
      ),
    );
  }
}
