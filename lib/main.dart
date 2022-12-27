import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

Future<dynamic> backgroundMessageHandler(RemoteMessage message) async {
  log('On Background: ${message.notification!.title!}/${message.notification!.body!}/${message.notification!.titleLocKey!}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log('Got a message  in the foreground!');
    log('Message data: ${message.data}');
    Noti.showBigTextNotification(
      title: message.notification!.title!,
      body: message.notification!.body!,
      fln: flutterLocalNotificationsPlugin,
    );

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  try {
    if (GetPlatform.isMobile) {
      final RemoteMessage? remoteMessage = await messaging.getInitialMessage();

      await Noti.initialize(flutterLocalNotificationsPlugin);
      FirebaseMessaging.onBackgroundMessage(backgroundMessageHandler);
    }
  } catch (error) {
    //
  }

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
      initialRoute: RoutesClass.getMainRoute(),
      getPages: RoutesClass.routes,
      initialBinding: AllControllerBinding(),
    );
  }
}
