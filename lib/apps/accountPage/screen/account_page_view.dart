import 'package:digital_shop/apps/accountPage/controller/account_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';

class AccountPageView extends GetView<AccountPageController> {
  const AccountPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text('Account'),
      ),
    );
  }
}
