import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/routes/routes.dart';
import '../../../general/utils/config.dart';
import '../widgets/body_view.dart';

class CartPageView extends GetView<CartPageController> {
  const CartPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: mainPageController.currentIndex.value != 3
          ? AppBar(
              title: const Text('Cart'),
              centerTitle: true,
            )
          : null,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Obx(
              () => authController.user.value != null
                  ? BodyView()
                  : Column(
                      children: [
                        Image.asset(
                          'assets/images/oops.jpg',
                          scale: 2,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: Config.screenWidth! * .2,
                              vertical: Config.screenHeight! * .02,
                            ),
                          ),
                          child: const Text('Please Login Your Account'),
                          onPressed: () {
                            Get.offAllNamed(RoutesClass.getLoginPageRoute());
                          },
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: authController.user.value != null
          ? BottomAppBar(
              elevation: 0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 15),
                height: Config.screenHeight! * 0.09,
                //color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Total : ',
                        style: TextStyle(
                          ///color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        '৳ ${controller.totalPrice}',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: Config.screenHeight! * .06,
                          width: Config.screenWidth! * .35,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(7)),
                          child: const Text(
                            'Checkout',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }
}
