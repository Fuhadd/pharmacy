import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../constants/custom_colors.dart';
import '../utils/spacers.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: "Profile",
              ),
              verticalSpacer(30),
              const Row(
                children: [
                  Text(
                    "Reset Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              verticalSpacer(10),
              customTextField3(
                "resetPassword",
                hintText: "Enter new password",
              ),
              verticalSpacer(20),
              const Row(
                children: [
                  Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              verticalSpacer(10),
              customTextField3(
                "ConfirmPassword",
                hintText: "Confirm new password",
              ),
              verticalSpacer(30),
              const CustomButton(
                title: "Submit",
              ),
              verticalSpacer(50),
              const Text(
                "Subscription Plan",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              verticalSpacer(10),
              const Text(
                '\$9.99/Month',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: CustomColors.buttonColor),
              ),
              verticalSpacer(10),
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.pinkColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 7),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: CustomColors.whiteColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
