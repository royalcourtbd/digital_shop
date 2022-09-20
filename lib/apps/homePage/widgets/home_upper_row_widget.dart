import 'package:flutter/material.dart';

import '../../../general/utils/config.dart';

class HomeUpperRowWidget extends StatelessWidget {
  HomeUpperRowWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  List color = [
    const Color.fromARGB(255, 0, 112, 4),
    Colors.red,
    const Color.fromARGB(255, 156, 142, 13),
    const Color.fromARGB(255, 19, 64, 131),
  ];

  final List icon;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      horizontal: Config.screenWidth! * .04),
                  child: Container(
                    alignment: Alignment.center,
                    //padding: const EdgeInsets.all(8),
                    width: Config.screenHeight! * 0.07,
                    height: Config.screenHeight! * 0.07,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      icon[index],
                      color: color[index],
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
