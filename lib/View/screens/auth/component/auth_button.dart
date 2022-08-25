// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../widgets/text_ultils.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    Key? key,
    required this.text,
    required this.onpress,
  }) : super(key: key);
  final String text;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 107, 220, 111),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: onpress,
        child: TextUltils(
          text: text,
          fontsize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
