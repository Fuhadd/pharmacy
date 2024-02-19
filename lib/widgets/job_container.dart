import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';
import '../utils/spacers.dart';

class JobContainer extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String date;
  final String time;
  final String imageUrl;
  final void Function()? onTap;
  const JobContainer({
    super.key,
    required this.companyName,
    required this.date,
    required this.jobTitle,
    required this.time,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: CustomColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      imageUrl,
                    ),
                  ),
                  horizontalSpacer(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        companyName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Column(
                        children: [
                          verticalSpacer(5),
                          Text(
                            jobTitle,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(15),
              const Divider(
                thickness: 1.1,
              ),
              verticalSpacer(20),
              Text(
                date,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              verticalSpacer(10),
              Text(
                time,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: CustomColors.buttonColor),
              ),
              verticalSpacer(5),
            ],
          ),
        ),
      ),
    );
  }
}
