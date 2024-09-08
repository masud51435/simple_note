import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container( 
        padding: EdgeInsets.only( 
          left: 20,
          right: 20,
          top: 50,
          bottom: 30,
        ),
      ),
    );
  }
}