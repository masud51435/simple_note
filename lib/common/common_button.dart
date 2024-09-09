import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/app_colors.dart';

class CommonButton extends StatelessWidget {
  CommonButton({
    super.key,
    required this.onTap,
    required this.text,
    this.loading = false,
    this.backgroundColor = Colors.black,
  });

  final void Function() onTap;
  final String text;
  final bool loading;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: whiteColor,
        fixedSize: Size(Get.width, 60),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: loading
          ? Center(
              child: CircularProgressIndicator(
                color: whiteColor,
              ),
            )
          : Text(text),
    );
  }
}
