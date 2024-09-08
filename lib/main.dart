import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/core/app_colors.dart';
import 'package:notes/core/app_routes.dart';

void main() {
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
      initialRoute: AppRoutes.SPLASHSCREEN,
      getPages: AppRoutes.routes,
    );
  }
}

