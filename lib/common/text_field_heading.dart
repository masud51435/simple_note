import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldHeading extends StatelessWidget {
  const TextFieldHeading({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
