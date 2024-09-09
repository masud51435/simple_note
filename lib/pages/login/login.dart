import 'package:flutter/material.dart';
import 'package:notes/common/authentication_appbar.dart';
import 'widgets/login_form.dart';
import 'widgets/login_header.dart';
import '../../common/or_section.dart';
import 'widgets/sign_up_section.dart';
import '../../common/social_button.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AuthenticationAppbar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            LoginHeader(),
            SizedBox(height: 25),
            SocialButton(),
            SizedBox(height: 20),
            OrSection(),
            SizedBox(height: 25),
            LoginForm(),
            SignUpSection(),
          ],
        ),
      ),
    );
  }
}
