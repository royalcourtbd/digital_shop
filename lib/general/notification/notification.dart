import 'dart:developer';

import 'package:digital_shop/apps/cartPage/screen/cart_page_view.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class HelperNotification {
  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize = const AndroidInitializationSettings('ic_launcher');

    var iOSInitialize = const IOSInitializationSettings();

    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);

    flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onSelectNotification: (payload) async {
        try {
          if (payload != null && payload.isNotEmpty) {
            Get.to(const CartPageView());
          } else {
            //
          }
        } catch (error) {
          throw Exception(error);
        }
        return;
      },
    );

    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        log('Got a message  in the foreground!');
        log('Message data: ${message.notification!.title}/${message.notification!.body}/${message.notification!.titleLocKey}');
        HelperNotification.showBigTextNotification(
          title: message.notification!.title!,
          body: message.notification!.body!,
          fln: flutterLocalNotificationsPlugin,
        );

        if (message.notification != null) {
          log('Message also contained a notification: ${message.notification}');
        }
      },
    );

    FirebaseMessaging.onMessageOpenedApp.listen(
      (RemoteMessage message) {
        if (kDebugMode) {
          log('app opened');
        }
        try {
          if (message.notification!.titleLocKey != null) {
            Get.to(const CartPageView());
          }
        } catch (error) {
          throw Exception(error);
        }
      },
    );
  }

  static Future showBigTextNotification({
    var id = 0,
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin fln,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'channelId',
      'channel_name',
      playSound: true,
      // sound: RawResourceAndroidNotificationSound('notification'),
      importance: Importance.max,
      priority: Priority.high,
    );

    var not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await fln.show(0, title, body, not);
  }
}
