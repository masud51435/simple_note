import 'package:flutter/material.dart';

import 'social_icon_button.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialIconButton(
          onTap: () {},
          image: 'assets/images/google.png',
        ),
        const SizedBox(width: 15),
        SocialIconButton(
          onTap: () {},
          image: 'assets/images/facebook.png',
        ),
        const SizedBox(width: 15),
        SocialIconButton(
          onTap: () {},
          image: 'assets/images/apple.png',
        ),
      ],
    );
  }
}
