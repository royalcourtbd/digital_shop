import 'package:flutter/material.dart';

import 'header_drawer.dart';

class DrawerForOtherPage extends StatelessWidget {
  const DrawerForOtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: const [
              MyHeaderDrawer(),
              //MyDraweList(),
            ],
          ),
        ),
      ),
    );
  }
}
