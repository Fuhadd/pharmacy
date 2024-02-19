import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../constants/custom_colors.dart';

Widget customTextField(String name,
    {required String hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    String? initialValue,
    bool isHint = false,
    bool obscureText = false,
    String? helperText,
    String? Function(String?)? validator,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 50,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.deepBlueColor.withOpacity(0.4),
          name: name,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.whiteColor),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.deepBlueColor),
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: GestureDetector(
                onTap: onSuffixTap,
                child: Icon(
                  suffixIcon,
                  size: 16,
                  color: CustomColors.blackColor,
                ),
              ),
              fillColor: CustomColors.whiteColor,
              filled: true,
              hintText: hintText,
              // labelText: hintText,
              hintStyle: const TextStyle(
                  color: CustomColors.greyTextColor, fontSize: 15)),
        ),
      ),
    ],
  );
}

Widget customTextField2(String name,
    {required String hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    Widget? suffix,
    String? initialValue,
    bool isHint = false,
    bool obscureText = false,
    String? helperText,
    String? Function(String?)? validator,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 47,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.deepBlueColor.withOpacity(0.4),
          name: name,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: CustomColors.blackColor.withOpacity(0.1)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: CustomColors.deepBlueColor),
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: suffix ??
                GestureDetector(
                  onTap: onSuffixTap,
                  child: Icon(
                    suffixIcon,
                    size: 16,
                    color: CustomColors.blackColor,
                  ),
                ),
            fillColor: CustomColors.whiteColor,
            filled: true,
            hintText: hintText,
            // labelText: hintText,
            hintStyle: const TextStyle(
                color: CustomColors.hintTextColor, fontSize: 14),
          ),
        ),
      ),
    ],
  );
}

Widget customMultiTextField(String name,
    {required String hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    String? initialValue,
    bool isHint = false,
    bool obscureText = false,
    String? helperText,
    String? Function(String?)? validator,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0.0),
    child: Column(
      children: [
        Expanded(
          child: FormBuilderTextField(
            initialValue: initialValue,
            // cursorColor: CustomColors.,
            maxLines: 40,
            name: name,
            obscureText: obscureText,
            validator: validator,
            onChanged: onChanged,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.grey.withOpacity(0.5), width: 0.2),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              contentPadding: const EdgeInsets.all(10.0),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customTextField3(String name,
    {required String hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    Widget? prefix,
    String? initialValue,
    bool isHint = false,
    bool obscureText = false,
    String? helperText,
    String? Function(String?)? validator,
    void Function()? onSuffixTap,
    void Function(String?)? onChanged}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 45,
        child: FormBuilderTextField(
          initialValue: initialValue,
          cursorColor: CustomColors.deepBlueColor.withOpacity(0.4),
          name: name,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.whiteColor),
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(color: CustomColors.deepBlueColor),
                borderRadius: BorderRadius.circular(5),
              ),
              suffixIcon: GestureDetector(
                onTap: onSuffixTap,
                child: Icon(
                  suffixIcon,
                  size: 16,
                  color: CustomColors.blackColor,
                ),
              ),
              fillColor: CustomColors.whiteColor,
              filled: true,
              hintText: hintText,
              // labelText: hintText,
              hintStyle: const TextStyle(
                  color: CustomColors.greyTextColor, fontSize: 13)),
        ),
      ),
    ],
  );
}
