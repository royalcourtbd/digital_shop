import 'package:digital_shop/apps/accountPage/controller/account_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authPage/controller/auth_controller.dart';

class AccountPageView extends GetView<AccountPageController> {
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => authController.user.value != null
          ? GetX(
              init: AccountPageController(),
              builder: <AccountPageController>(controller) {
                return ListView.builder(
                  itemCount: controller.buyItemUSDList.value.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        controller.buyItemUSDList.value[index].dollarName,
                      ),
                      leading: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            //color: Colors.redAccent,
                            ),
                        child: Image.network(
                          controller.buyItemUSDList.value[index].dollarIcon,
                        ),
                      ),
                      trailing: Text(
                        controller.buyItemUSDList.value[index].currentPrice,
                      ),
                    );
                  },
                );
              },
            )
          : const Center(
              child: Text('Its work'),
            ),
    ));
  }
}
