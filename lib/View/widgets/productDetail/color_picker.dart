import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({
    super.key,
    required this.color,
    required this.outerBoder,
  });
  final Color color;
  final bool outerBoder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: outerBoder ? Border.all(color: color, width: 2) : null),
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
