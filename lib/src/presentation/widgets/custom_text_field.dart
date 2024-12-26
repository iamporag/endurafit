import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final FormFieldValidator? validator;
  final String? errorText;
  final String hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.errorText,
    required this.hintText,
    this.obscureText,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText ?? false,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      decoration: InputDecoration(
        errorText: errorText,
        filled: true,
        fillColor: Color(0xFFF3F3F4),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Color(0xFFF97316), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.red.shade500, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFF3F3F4),
          ),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
