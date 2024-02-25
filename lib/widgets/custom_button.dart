import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String? routeName;
  final bool isLoading;
  final bool isBoldTitle;
  final void Function()? onTap;
  const CustomButton({
    required this.title,
    this.routeName,
    this.onTap,
    this.isLoading = false,
    this.isBoldTitle = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            // Navigator.pushNamed(context, routeName!);
            // Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: CustomColors.deepBlueColor,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator(
                  color: CustomColors.whiteColor,
                )
              : Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: CustomColors.whiteColor),
                ),
        ),
      ),
    );
  }
}
