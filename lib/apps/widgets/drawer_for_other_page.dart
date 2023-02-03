import 'package:digital_shop/apps/widgets/drawer_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

import '../../general/constants/constants.dart';
import '../../general/routes/routes.dart';
import '../multiPages/screen/privacy_policy_page_view.dart';
import 'header_drawer.dart';

class DrawerForOtherPage extends StatelessWidget {
  const DrawerForOtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeaderDrawer(),
            MyEcomDraweList(),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget MyEcomDraweList() {
  return Container(
    padding: const EdgeInsets.only(
      top: 15,
    ),
    child: Column(
      children: [
        Obx(
          () => authController.user.value != null
              ? DrawerListItem(
                  icon: IconlyLight.plus,
                  onPressed: () => navigateToEcom(1),
                  color: Get.currentRoute == RoutesClass.walletPage
                      ? Colors.black
                      : Colors.black,
                  materialColor: Get.currentRoute == RoutesClass.walletPage
                      ? Colors.grey.shade300
                      : const Color(0xfffafafa),
                  title: 'Wallet',
                )
              : const SizedBox(),
        ),
        Obx(
          () => authController.user.value != null
              ? DrawerListItem(
                  icon: IconlyLight.swap,
                  onPressed: () => navigateToEcom(3),
                  color: Get.currentRoute == RoutesClass.sellHistory
                      ? Colors.black
                      : Colors.black,
                  materialColor: Get.currentRoute == RoutesClass.sellHistory
                      ? Colors.grey.shade300
                      : const Color(0xfffafafa),
                  title: 'Transaction History',
                )
              : const SizedBox(),
        ),
        Obx(() => authController.user.value != null
            ? DrawerListItem(
                icon: IconlyLight.location,
                onPressed: () => navigateToEcom(4),
                color: Get.currentRoute == RoutesClass.addressPage
                    ? Colors.black
                    : Colors.black,
                materialColor: Get.currentRoute == RoutesClass.addressPage
                    ? Colors.grey.shade300
                    : const Color(0xfffafafa),
                title: 'Shipping Address',
              )
            : const SizedBox()),
        DrawerListItem(
          icon: IconlyLight.shield_done,
          onPressed: () => navigateToEcom(5),
          color: Get.currentRoute == const PrivacyPolicyPageView()
              ? Colors.black
              : Colors.black,
          materialColor: Get.currentRoute == const PrivacyPolicyPageView()
              ? Colors.grey.shade300
              : const Color(0xfffafafa),
          title: 'Privacy Policy',
        ),
      ],
    ),
  );
}

navigateToEcom(int index) {
  if (index == 0) {
    Get.back();
    Get.offNamed(RoutesClass.getMainRoute());
  } else if (index == 1) {
    Get.back();
    Get.toNamed(RoutesClass.getWalletPageRoute());
  } else if (index == 2) {
    Get.back();
    Get.toNamed(RoutesClass.getSellPageRoute());
  } else if (index == 3) {
    Get.back();
    Get.toNamed(RoutesClass.getSellHistoryPageRoute());
  } else if (index == 4) {
    Get.back();
    Get.toNamed(RoutesClass.getAddressPageRoute());
  } else if (index == 5) {
    Get.back();
    Get.to(const PrivacyPolicyPageView());
  }
}
