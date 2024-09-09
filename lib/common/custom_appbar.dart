import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = false,
    this.backGroundColor = Colors.transparent,
    this.leading,
    this.showBackArrow = true,
    this.textColor,
    this.iconColor,
    this.leadingWidth = 30,
  });

  final String title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final Color? backGroundColor, textColor, iconColor;
  final Widget? leading;
  final bool showBackArrow;
  final double leadingWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AppBar(
        leadingWidth: leadingWidth,
        backgroundColor: backGroundColor,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Icons.arrow_back,
                  color: iconColor,
                  size: 30,
                ),
              )
            : leading,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
            fontSize: 22,
          ),
        ),
        centerTitle: centerTitle,
        actions: actions,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
