import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../general/utils/config.dart';

class MyHeaderDrawer extends StatelessWidget {
  const MyHeaderDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      height: Config.screenWidth! * .5,
      padding: const EdgeInsets.only(top: 20.0),
      decoration: const BoxDecoration(
        color: Colors.green,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: Config.screenHeight! * .11,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/currency/bkash.png'),
              ),
            ),
          ),
          const AutoSizeText(
            'Royal Court BD',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          AutoSizeText(
            'royalcourtbd@gmail.com',
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
