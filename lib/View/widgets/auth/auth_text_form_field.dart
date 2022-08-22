// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Function? validator;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final String labelText;

  const AuthTextFormField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.validator,
    required this.prefixIcon,
    this.suffixIcon,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validator!(value),
      decoration: InputDecoration(
        fillColor: Colors.white30,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
        filled: true,
        isDense: true,
        hintStyle: const TextStyle(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      // focusedBorder: OutlineInputBorder(
      //     borderSide: (const BorderSide(color: Colors.green)),
      //     borderRadius: BorderRadius.circular(20)),
      // errorBorder: OutlineInputBorder(
      //     borderSide: (const BorderSide(color: Colors.white)),
      //     borderRadius: BorderRadius.circular(20)),
      // focusedErrorBorder: OutlineInputBorder(
      //     borderSide: (const BorderSide(color: Colors.white)),
      //     borderRadius: BorderRadius.circular(20)),
    );
  }
}
