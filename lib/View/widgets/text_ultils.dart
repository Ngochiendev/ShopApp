import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUltils extends StatelessWidget {
  final String text;
  final double? fontsize;
  final Color? color;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final double? letterSpacing;

  const TextUltils({
    Key? key,
    required this.text,
    this.fontsize,
    this.color,
    this.textOverflow,
    this.fontWeight,
    this.decoration,
    this.textAlign,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color,
          fontSize: fontsize,
          overflow: textOverflow,
          fontWeight: fontWeight,
          decoration: decoration,
          letterSpacing: letterSpacing,
        ),
      ),
    );
  }
}
