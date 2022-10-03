import 'package:digital_shop/apps/accountPage/controller/account_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountPageView extends GetView<AccountPageController> {
  const AccountPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: controller.buyItemUSDList.value.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              controller.buyItemUSDList.value[index].dollarName.toString(),
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
      ),
    ));
  }
}
