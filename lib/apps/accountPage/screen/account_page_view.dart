import 'package:digital_shop/apps/accountPage/controller/account_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer_image/shimmer_image.dart';

class AccountPageView extends GetView<AccountPageController> {
  AccountPageView({Key? key}) : super(key: key);
  AccountPageController accountPageController =
      Get.put(AccountPageController());

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
              child: ProgressiveImage(
                imageError: 'assets/images/loading.jpg',
                image: controller.buyItemUSDList.value[index].dollarIcon,
                height: 50,
                width: 50,
              ),
            ),
            trailing: InkWell(
              onTap: () {
                controller.plaorder();
              },
              child: Text(
                controller.buyItemUSDList.value[index].currentPrice,
              ),
            ),
          );
        },
      ),
    ));
  }
}
