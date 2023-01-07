import 'dart:developer';

import 'package:digital_shop/apps/accountPage/controller/account_page_controller.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../../general/routes/routes.dart';
import '../../../general/utils/config.dart';
import '../../authPage/screen/password_reset.dart';
import '../widgets/profile_list_tile.dart';

class AccountPageView extends GetView<AccountPageController> {
  const AccountPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      key: controller.scaffoldKey,
      body: authController.user.value != null
          ? Obx(
              (() => SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Stack(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: controller.isUploading.value
                                      ? const CircularProgressIndicator()
                                      : FancyShimmerImage(
                                          errorWidget: const Icon(
                                            IconlyBold.profile,
                                            size: 92,
                                            color: Color.fromARGB(
                                                158, 116, 210, 222),
                                          ),
                                          imageUrl:
                                              controller.profile.value!.image!,
                                          width: 110,
                                          height: 110,
                                          boxFit: BoxFit.contain,
                                          // boxDecoration:
                                          //     BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                        ),
                                ),
                              ),
                              Positioned(
                                right: 2,
                                top: 2,
                                child: InkWell(
                                  onTap: () {
                                    controller
                                        .addProfileImage(auth.currentUser!.uid);
                                  },
                                  child: const Icon(
                                    IconlyBold.edit,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Obx(
                          () => controller.profile.value != null
                              ? Text(
                                  controller.profile.value!.name!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Container(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Obx(
                          () => controller.profile.value != null
                              ? Text(
                                  controller.profile.value!.email!,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              : Container(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Chip(
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Obx(
                                () => controller.profile.value != null
                                    ? Text(
                                        '${controller.profile.value!.accountBalance}  Points',
                                      )
                                    : Container(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                height: Config.screenHeight! * 0.1,
                                width: double.infinity,
                                //color: Colors.white,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.iconList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Config.screenWidth! * .05,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          if (controller.iconName[index] ==
                                              'Address') {
                                            Get.toNamed(
                                              RoutesClass.getAddressPageRoute(),
                                            );
                                          } else {
                                            Fluttertoast.showToast(
                                              msg: "Coming Soon",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.BOTTOM,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.white,
                                              textColor: Colors.black54,
                                              fontSize: 16.0,
                                            );
                                          }
                                          log(controller.iconName[index]);
                                          //
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              //padding: const EdgeInsets.all(8),
                                              width:
                                                  Config.screenHeight! * 0.07,
                                              height:
                                                  Config.screenHeight! * 0.06,
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.06),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Icon(
                                                controller.iconList[index],
                                                color: controller
                                                    .iconBgColor[index],
                                                size: 28,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(controller.iconName[index])
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ProfileListTile(
                          onTap: () {},
                          title: 'Wishlist',
                          icon: IconlyLight.heart,
                          bgColor: const Color.fromARGB(255, 243, 50, 28),
                          isLast: true,
                        ),
                        ProfileListTile(
                          onTap: () {},
                          title: 'Noification',
                          bgColor: const Color.fromARGB(255, 244, 188, 19),
                          icon: IconlyLight.notification,
                          isLast: true,
                        ),
                        ProfileListTile(
                          onTap: () {
                            Get.to(() => const PasswordResetPage());
                          },
                          title: 'Change Password',
                          bgColor: const Color.fromARGB(255, 39, 42, 237),
                          icon: IconlyLight.password,
                          isLast: false,
                        )
                      ],
                    ),
                  )),
            )
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
    );
  }
}
