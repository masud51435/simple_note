import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();

  @override
  void onReady() {
    super.onReady();
    screenRedirect();
  }

  isLogin() {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAllNamed('/homePage');
    } else {
      Get.offAllNamed('/login');
    }
  }

  void screenRedirect() async {
    bool? isFirstTime = deviceStorage.read('isFirstTime');

    if (isFirstTime == null || isFirstTime == true) {
      // If it's the first time, show the splash screen
      await Get.toNamed('/splashScreen');
      // After showing the splash screen, set isFirstTime to false
      deviceStorage.write('isFirstTime', false);
      // Navigate to the next screen
      isLogin();
    } else {
      // If it's not the first time, go directly to the next screen
      isLogin();
    }
  }
}
