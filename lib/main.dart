import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'bindings/all_controller_binding.dart';
import 'firebase_options.dart';
import 'general/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.green,
    ),
  );
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Digital Shop',
      theme: ThemeData(
        // fontFamily: 'Raleway',
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      // home: TestWidget(),
      initialRoute: RoutesClass.getAddAddressPageRoute(),
      getPages: RoutesClass.routes,
      initialBinding: AllControllerBinding(),
    );
  }
}
