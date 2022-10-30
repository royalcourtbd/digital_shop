import 'package:digital_shop/apps/homePage/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../general/utils/config.dart';

class HomeUpperRowWidget extends GetView<HomePageController> {
  HomeUpperRowWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  List color = [
    const Color.fromARGB(255, 122, 175, 124),
    const Color.fromARGB(255, 204, 160, 157),
    const Color.fromARGB(255, 170, 166, 129),
    const Color.fromARGB(255, 110, 124, 146),
  ];

  final List icon;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: Config.screenHeight! * 0.07,
            width: double.infinity,
            //color: Colors.white,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: icon.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Config.screenWidth! * .05,
                  ),
                  child: InkWell(
                    onTap: () {
                      //
                      Fluttertoast.showToast(
                        msg: "Coming Soon",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.black54,
                        fontSize: 16.0,
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      //padding: const EdgeInsets.all(8),
                      width: Config.screenHeight! * 0.07,
                      height: Config.screenHeight! * 0.07,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        icon[index],
                        color: color[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
