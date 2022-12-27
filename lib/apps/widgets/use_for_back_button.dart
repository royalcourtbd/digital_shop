import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UseForBackButton {
  static Future<bool> backButton() async {
    return (await showDialog(
      context: Get.overlayContext!,
      builder: (context) => AlertDialog(
        title: const Text('Are You Sure'),
        content: const Text('Do You want to close the app?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    ));
  }
}
