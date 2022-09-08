import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageView extends GetView<HomePageController> {
  HomePageView({Key? key}) : super(key: key);

  CollectionReference reference =
      FirebaseFirestore.instance.collection('received_USD');

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text('data'),
          ),
        ],
      ),
    );
  }
}
