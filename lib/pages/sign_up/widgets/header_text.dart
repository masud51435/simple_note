import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpHeaderText extends StatelessWidget {
  const SignUpHeaderText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi!',
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Create a new account',
          style: GoogleFonts.poppins(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}