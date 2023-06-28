import 'package:digital_shop/bindings/all_controller_binding.dart';
import 'package:digital_shop/general/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class DigitalShopInitial extends StatelessWidget {
  const DigitalShopInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _setUpStatusBarColor();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),

      title: 'Digital Shop',
      theme: ThemeData(
        // fontFamily: 'Raleway',
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      //home: const PrivacyPolicyPageView(),
      initialRoute: RoutesClass.getMainRoute(),
      getPages: RoutesClass.routes,
      initialBinding: AllControllerBinding(),
    );
  }

  static void _setUpStatusBarColor() {
    const Color color = Colors.green;
    const SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: color,
      statusBarColor: color,
      systemNavigationBarContrastEnforced: true,
      systemNavigationBarIconBrightness: Brightness.dark,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
