import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/controllers/authentication/authentication_repository.dart';
import 'package:notes/core/app_colors.dart';
import 'package:notes/core/app_routes.dart';
import 'package:notes/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //GetX local Storage
  await GetStorage.init();

  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (FirebaseApp value) => Get.put(
      AuthenticationRepository(),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: whiteColor),
        useMaterial3: true,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      initialRoute: AppRoutes.FRONTPAGE,
      getPages: AppRoutes.routes,
    );
  }
}
