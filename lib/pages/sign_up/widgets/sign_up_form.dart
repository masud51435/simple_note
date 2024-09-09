import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/common_button.dart';
import '../../../common/text_field_heading.dart';
import '../../../controllers/authentication/signup_controller.dart';
import '../../../core/app_colors.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SignUpController controller = Get.put(SignUpController());
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextFieldHeading(text: 'Name'),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.nameController,
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: greyColor.withOpacity(0.5),
              hintText: 'userName',
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
          const TextFieldHeading(text: 'Email Address'),
          const SizedBox(height: 10),
          TextFormField(
            controller: controller.emailController,
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
              controller: controller.passwordController,
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
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {},
              ),
              Text(
                "Terms & Condition",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Obx(
            () => CommonButton(
              loading: controller.loading.value,
              onTap: () {
                if (controller.formKey.currentState!.validate()) {
                  controller.signUp();
                }
              },
           
              backgroundColor: blackColor,
              text: "Create Account",
            ),
          ),
        ],
      ),
    );
  }
}
