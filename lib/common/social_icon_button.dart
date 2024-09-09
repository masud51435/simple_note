import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  const SocialIconButton({
    super.key,
    required this.onTap,
    required this.image,
    this.height = 25,
  });
  final void Function() onTap;
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Image(
          height: height,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
