import 'package:flutter/material.dart';
import '../../common/or_section.dart';
import '../../common/social_button.dart';
import 'widgets/bottom_sign_in_section.dart';
import 'widgets/header_text.dart';
import '../../common/authentication_appbar.dart';
import 'widgets/sign_up_form.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: AuthenticationAppbar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SignUpHeaderText(),
            SizedBox(height: 25),
            SocialButton(),
            SizedBox(height: 20),
            OrSection(),
            SizedBox(height: 25),
            SignUpForm(),
            BottomSignInSection(),
          ],
        ),
      ),
    );
  }
}
