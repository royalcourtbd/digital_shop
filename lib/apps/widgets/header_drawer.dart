import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../general/routes/routes.dart';
import '../../general/utils/config.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      height: Config.screenWidth! * .55,
      padding: const EdgeInsets.only(top: 27.0),
      decoration: const BoxDecoration(
        color: Colors.green,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => authController.user.value != null
                ? Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: FancyShimmerImage(
                        errorWidget: const Icon(
                          IconlyBold.profile,
                          size: 92,
                          color: Color.fromARGB(158, 116, 210, 222),
                        ),
                        imageUrl: accountPageController.profile.value!.image!,
                        width: 110,
                        height: 110,
                        boxFit: BoxFit.contain,
                        // boxDecoration:
                        //     BoxDecoration(borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  )
                : TextButton(
                    style: TextButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: EdgeInsets.symmetric(
                        horizontal: Config.screenWidth! * .03,
                        vertical: Config.screenHeight! * .02,
                      ),
                    ),
                    child: const Text(
                      'Please Login Your Account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Get.offAllNamed(RoutesClass.getLoginPageRoute());
                    },
                  ),
          ),
          Obx(
            () => authController.user.value != null
                ? AutoSizeText(
                    accountPageController.profile.value!.name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container(),
          ),
          Obx(
            () => authController.user.value != null
                ? Text(
                    accountPageController.profile.value!.email!,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
