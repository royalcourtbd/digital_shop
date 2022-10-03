import 'package:flutter/material.dart';

import '../../../general/utils/config.dart';

class CartButton extends StatelessWidget {
  Color color;
  String title;
  BorderRadiusGeometry? borderRadius;
  CartButton(
      {Key? key, required this.color, required this.title, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        alignment: Alignment.center,
        width: Config.screenWidth! * 0.4,
        height: Config.screenHeight! * 0.06,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
