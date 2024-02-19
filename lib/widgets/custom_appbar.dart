import 'package:flutter/material.dart';

import '../constants/custom_string.dart';
import '../utils/spacers.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final String? subtitle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacer(MediaQuery.of(context).padding.top + 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                  ),
                ),
                subtitle != null
                    ? Column(
                        children: [
                          verticalSpacer(5),
                          Text(
                            subtitle!,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(
                ConstantString.profileAvatar,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
