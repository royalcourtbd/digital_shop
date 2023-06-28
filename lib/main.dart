import 'dart:developer';

import 'package:digital_shop/digital_shop_initial.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'firebase_options.dart';
import 'general/constants/constants.dart';
import 'general/notification/notification.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  log('On Background: ${message.notification!.title!}/${message.notification!.body!}/${message.notification!.titleLocKey!}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  _initialiseServices();

  runApp(const DigitalShopInitial());
}

Future<void> _initialiseServices() async {
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

  await GetStorage.init();
}
