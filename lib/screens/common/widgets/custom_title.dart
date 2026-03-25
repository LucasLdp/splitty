import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomTitle({
    super.key,
    required this.title,
    this.fontSize = 32,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.sora(fontSize: fontSize, fontWeight: FontWeight.w800),
    );
  }
}
