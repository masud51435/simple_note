import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/common_button.dart';
import '../../../common/text_field_heading.dart';
import '../../../controllers/authentication/login_controller.dart';
import '../../../core/app_colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return Form(
      key: controller.formKeys,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldHeading(text: 'Email Address'),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.emailControllers,
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mail';
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: greyColor.withOpacity(0.5),
              hintText: 'youremail@gmail.com',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 13,
                horizontal: 15,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const TextFieldHeading(text: 'Password'),
          const SizedBox(height: 10),
          Obx(
            () => TextFormField(
              controller: controller.passwordControllers,
              keyboardType: TextInputType.visiblePassword,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              obscureText: controller.toggle.value,
              decoration: InputDecoration(
                filled: true,
                fillColor: greyColor.withOpacity(0.5),
                hintText: '***********',
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 15,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.toggle.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: controller.setToggle,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "Remember Me",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Obx(
            () => CommonButton(
              loading: controller.loading.value,
              onTap: () {
                if (controller.formKeys.currentState!.validate()) {
                  controller.login();
                }
              },
              backgroundColor: blackColor,
              text: "Sign In",
            ),
          ),
        ],
      ),
    );
  }
}
