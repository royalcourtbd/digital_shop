import 'package:auto_size_text/auto_size_text.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../general/constants/constants.dart';
import '../../../general/utils/config.dart';
import '../controller/address_page_controller.dart';
import '../widgets/address_view_widget.dart';
import '../widgets/home_and_edit_button_widget.dart';

class AddressPageView extends GetView<AddressPageController> {
  const AddressPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: const Text('Shipping Address'),
      ),
      body: Obx(
        () => authController.user.value != null
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
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
                    const SizedBox(
                      height: 15,
                    ),
                    const AddressViewWidget()
                  ],
                ))
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/png_icon/sign.png'),
                    const Text('No User Found'),
                    InkWell(
                      onTap: () {
                        Get.offAllNamed(RoutesClass.getLoginPageRoute());
                      },
                      child: const AutoSizeText(
                        'Please Login First',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
