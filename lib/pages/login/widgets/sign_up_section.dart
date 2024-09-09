import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpSection extends StatelessWidget {
  const SignUpSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have any account?",
        ),
        TextButton(
          onPressed: () => Get.toNamed('/signUp'),
          child: const Text(
            "Sign Up",
          ),
        ),
      ],
    );
  }
}
