import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Frontpage extends StatelessWidget {
  const Frontpage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: Center(
        child: CupertinoActivityIndicator(
          color: Colors.black,
          radius: 30,
        ),
      ),
    );
  }
}
