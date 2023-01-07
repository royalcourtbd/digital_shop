import 'package:digital_shop/apps/addressPage/controller/address_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AddressTextField extends GetView<AddressPageController> {
  Function(String)? onChanged;
  Function()? onTap;
  Function(String?)? onSaved;
  String? Function(String?)? validator;
  List<TextInputFormatter> inputFormatters;
  TextInputType? keyboardType;
  int? maxLength;
  Widget? prefixIcon;
  Widget? suffixIcon;

  String hintText;

  FocusNode? focusNode;

  TextEditingController textEditingController;

  AddressTextField({
    Key? key,
    required this.hintText,
    this.focusNode,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    required this.textEditingController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        validator: validator,
        onTap: onTap,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
              width: 2,
            ),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.black26),
          filled: true,
          counterText: '',
        ),
      ),
    );
  }
}
