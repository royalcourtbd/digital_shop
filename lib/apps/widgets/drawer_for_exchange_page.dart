import 'package:digital_shop/apps/widgets/drawer_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../general/routes/routes.dart';
import 'header_drawer.dart';

class DrawerForExchangePage extends StatelessWidget {
  const DrawerForExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const MyHeaderDrawer(),
            MyDraweList(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget MyDraweList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          DrawerListItem(
            icon: Icons.shopping_cart_checkout,
            onPressed: () => navigate(1),
            color: Get.currentRoute == RoutesClass.buyPage
                ? Colors.black
                : Colors.black,
            materialColor: Get.currentRoute == RoutesClass.buyPage
                ? Colors.grey.shade300
                : const Color(0xfffafafa),
            title: 'Buy Dollar',
          ),
          DrawerListItem(
            icon: Icons.shopping_bag_outlined,
            onPressed: () => navigate(2),
            color: Get.currentRoute == RoutesClass.sellPage
                ? Colors.black
                : Colors.black,
            materialColor: Get.currentRoute == RoutesClass.sellPage
                ? Colors.grey.shade300
                : const Color(0xfffafafa),
            title: 'Sell Dollar',
          ),
          DrawerListItem(
            icon: Icons.arrow_back,
            onPressed: () => navigate(3),
            color: Get.currentRoute == RoutesClass.sellHistory
                ? Colors.black
                : Colors.black,
            materialColor: Get.currentRoute == RoutesClass.sellHistory
                ? Colors.grey.shade300
                : const Color(0xfffafafa),
            title: 'Transaction History',
          ),
        ],
      ),
    );
  }

  navigate(int index) {
    if (index == 1) {
      Get.back();
      Get.toNamed(RoutesClass.getBuyPageRoute());
    } else if (index == 2) {
      Get.back();
      Get.toNamed(RoutesClass.getSellPageRoute());
    } else if (index == 3) {
      Get.back();
      Get.toNamed(RoutesClass.getSellHistoryPageRoute());
    }
  }
}
