// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    this.inputType,
    this.onchanged,
    this.obscure = false
  });
  final bool? obscure;
  final String hintText;
  Function(String)? onchanged;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscure!,
      onChanged: onchanged,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8)
        ),
        border:  OutlineInputBorder(
          borderSide: const BorderSide(),
          borderRadius: BorderRadius.circular(8)
        ),
      ),
    );
  }
}
