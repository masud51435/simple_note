import 'package:get/get.dart';
import '../pages/home_page/home_page.dart';
import '../pages/splash_screen/splash_screen.dart';

class AppRoutes {
  static String FRONTPAGE = '/frontPage';
  static String SPLASHSCREEN = '/splashScreen';
  static String HOMEPAGE = '/homePage';
  static String CART = '/cart';
  static String CHECKOUT = '/checkOut';
  static String PROFILE = '/profile';
  static String SETTINGS = '/settings';
  static String ORDERLIST = '/orderList';
  static String WISHLIST = '/wishList';
  static String NOTIFICATION = '/notification';
  static String SIGNUP = '/signUp';
  static String LOGIN = '/login';

  static List<GetPage> routes = [
    // GetPage(
    //   name: FRONTPAGE,
    //   page: () => const Frontpage(),
    // ),
    GetPage(
      name: SPLASHSCREEN,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: HOMEPAGE,
      page: () => const HomePage(),
    ),

  ];
}
