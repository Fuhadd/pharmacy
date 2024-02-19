import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';
import '../utils/spacers.dart';

class KnowledgeContainer extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String date;
  final String time;
  final String imageUrl;
  const KnowledgeContainer({
    super.key,
    required this.companyName,
    required this.date,
    required this.jobTitle,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          children: [
            Image.asset(imageUrl),
            verticalSpacer(15),
            const Text(
              "Scrum",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            verticalSpacer(10),
            const Divider(
              thickness: 1.1,
            ),
            verticalSpacer(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                "Scrum is an empirical process, where decisions are based on observation, experience and experimentation",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: CustomColors.deepBlueColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
