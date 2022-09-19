import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controller/sell_page_controller.dart';

class TextFieldForSell extends GetView<SellPageController> {
  TextInputType textInputType;

  Function(String)? onChanged;
  Function()? onTap;
  Function(String?)? onSaved;
  String? Function(String?)? validator;

  int maxLines;
  String hintText;
  bool autofocus;
  int maxLength;
  FocusNode? focusNode;
  List<TextInputFormatter> inputFormatters;
  TextEditingController textEditingController;
  TextFieldForSell({
    Key? key,
    required this.textInputType,
    required this.hintText,
    this.maxLines = 1,
    this.inputFormatters = const [],
    this.maxLength = 32,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onSaved,
    this.validator,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.green,
          ),
        ),
        height: 50,
        child: TextFormField(
          onTap: onTap,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          focusNode: focusNode,
          autofocus: autofocus,
          inputFormatters: inputFormatters,
          controller: textEditingController,
          keyboardType: textInputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            counterText: '',
            focusColor: Colors.white,
            border: InputBorder.none,
          ),
          maxLength: maxLength,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
