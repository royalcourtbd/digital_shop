import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'bindings/all_controller_binding.dart';
import 'firebase_options.dart';
import 'general/constants/constants.dart';
import 'general/notification/notification.dart';
import 'general/routes/routes.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print(
      'On Background: ${message.notification!.title!}/${message.notification!.body!}/${message.notification!.titleLocKey!}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  try {
    if (GetPlatform.isMobile) {
      final RemoteMessage? remoteMessage = await messaging.getInitialMessage();
      await HelperNotification.initialize(flutterLocalNotificationsPlugin);

      FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
    }
  } catch (error) {
    //
  }

  MobileAds.instance.initialize();

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
}
