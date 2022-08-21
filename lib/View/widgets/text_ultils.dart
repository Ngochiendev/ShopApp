// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUltils extends StatelessWidget {
  final String text;
  final double? fontsize;
  final Color? color;
  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;

  const TextUltils({
    Key? key,
    required this.text,
    this.fontsize,
    this.color,
    this.textOverflow,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: GoogleFonts.lato(
          textStyle: TextStyle(
            color: color,
            fontSize: fontsize,
            overflow: textOverflow,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
