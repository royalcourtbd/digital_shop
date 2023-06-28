import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final Color? bgColor;
  final IconData? icon;
  final String title;
  final bool isLast;
  final VoidCallback onTap;
  const ProfileListTile({
    Key? key,
    required this.title,
    required this.onTap,
    this.icon,
    this.bgColor,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
          leading: Container(
            alignment: Alignment.center,
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          title: Text(title),
        ),
        isLast ? const Divider() : Container()
      ],
    );
  }
}
