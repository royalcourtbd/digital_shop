import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldForInUp extends StatelessWidget {
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final bool obscureText;
  final int? maxLength;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final List<TextInputFormatter> inputFormatters;
  final TextInputType keyboardType;
  final String labelText;
  final TextEditingController controller;
  const TextFieldForInUp({
    Key? key,
    required this.keyboardType,
    required this.labelText,
    this.inputFormatters = const [],
    this.onChanged,
    this.maxLength,
    this.onTap,
    this.onSaved,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onTap: onTap,
        maxLength: maxLength,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          counterText: '',
          focusColor: Colors.white,
          suffixIcon: suffixIcon,
          //border: InputBorder.none,
        ),
      ),
    );
  }
}
