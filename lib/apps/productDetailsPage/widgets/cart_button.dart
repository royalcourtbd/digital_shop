import 'package:flutter/material.dart';

import '../../../general/utils/config.dart';

class CartButton extends StatelessWidget {
  Color color;
  String title;
  VoidCallback onPressed;

  CartButton({
    Key? key,
    required this.color,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return InkWell(
      onTap: onPressed,
      child: Card(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(15),
        // ),

        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
