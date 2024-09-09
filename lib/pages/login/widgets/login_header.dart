import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back!',
          style: GoogleFonts.poppins(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          'Please enter your details',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
