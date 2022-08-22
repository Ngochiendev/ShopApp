// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUltils extends StatelessWidget {
  final String text;
  final double? fontsize;
  final Color? color;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  const TextUltils({
    Key? key,
    required this.text,
    this.fontsize,
    this.color,
    this.textOverflow,
    this.fontWeight,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color,
          fontSize: fontsize,
          overflow: textOverflow,
          fontWeight: fontWeight,
          decoration: decoration,
        ),
      ),
    );
  }
}
