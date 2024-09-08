import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.backgroundColor,
    required this.image,
  });

  final Color backgroundColor;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.60,
      height: Get.height * 0.27,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Image.asset(image),
    );
  }
}
