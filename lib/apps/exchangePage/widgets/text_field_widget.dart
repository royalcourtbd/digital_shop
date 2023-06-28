import 'package:digital_shop/apps/exchangePage/controller/buy_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TextFieldWidget extends GetView<BuyPageController> {
  final TextInputType textInputType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final int maxLines;
  final String hintText;
  final bool autofocus;
  final int maxLength;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final List<TextInputFormatter> inputFormatters;
  final TextEditingController textEditingController;
  const TextFieldWidget({
    Key? key,
    required this.textInputType,
    required this.hintText,
    this.autovalidateMode,
    this.maxLines = 1,
    this.inputFormatters = const [],
    this.maxLength = 32,
    this.autofocus = false,
    this.focusNode,
    this.onChanged,
    this.onTap,
    this.onSaved,
    this.validator,
    this.prefixIcon,
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
          autovalidateMode: autovalidateMode,
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
            prefixIcon: prefixIcon,
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
