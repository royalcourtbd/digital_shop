import 'package:flutter/material.dart';

class OrderSummaryRow extends StatelessWidget {
  String? title;
  String? value;
  OrderSummaryRow({
    Key? key,
    this.title,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: const TextStyle(fontSize: 17),
        ),
        Text(
          '${value!} ৳',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
