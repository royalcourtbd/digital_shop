import 'package:digital_shop/apps/cartPage/screen/cart_page_view.dart';
import 'package:digital_shop/general/constants/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        const AndroidInitializationSettings('drawable/ic_launcher');

    var iOSInitialize = const IOSInitializationSettings();

    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);

    flutterLocalNotificationsPlugin.initialize(initializationsSettings);
    await flutterLocalNotificationsPlugin.initialize(
      initializationsSettings,
      onSelectNotification: (payload) {
        try {
          if (payload != null && payload.isNotEmpty) {
            print('nexr page link');
          } else {
            //
          }
        } catch (error) {
          return;
        }
      },
    );
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('app opened');
      try {
        if (message.notification!.titleLocKey != null) {
          Get.to(const CartPageView());
        }
      } catch (error) {}
    });
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
