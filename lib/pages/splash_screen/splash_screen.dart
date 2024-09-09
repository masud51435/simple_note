import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notes/common/common_button.dart';

import '../../core/app_colors.dart';
import 'widgets/image_container.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 80,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Stack(
              clipBehavior: Clip.none,
              children: [
                ImageContainer(
                  backgroundColor: Color.fromARGB(255, 227, 134, 244),
                  image: 'assets/images/bg1.png',
                ),
                Positioned(
                  bottom: -120,
                  left: 140,
                  child: ImageContainer(
                    backgroundColor: Color.fromARGB(255, 132, 61, 255),
                    image: 'assets/images/bg2.png',
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'all of your notes, \nin one place',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'jot down on whenever and wherever you want, let the rest up to us',
                  style: TextStyle(
                    fontSize: 18,
                    color: blackColor.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 30),
                CommonButton(
                  onTap: () {
                    final deviceStorage = GetStorage();
                    deviceStorage.write('isFirstTime', false);
                    Get.toNamed('/login');
                  },
                  text: 'Get Started',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
