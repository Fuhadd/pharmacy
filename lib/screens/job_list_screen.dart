import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';
import '../constants/custom_string.dart';
import '../utils/spacers.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/job_container.dart';

class JobListScreen extends StatelessWidget {
  final void Function()? onTap;
  final void Function()? onJobTap;
  const JobListScreen({
    super.key,
    required this.onTap,
    required this.onJobTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const CustomAppBar(
              title: "Welcome Clinton",
              subtitle: "How are you Today?",
            ),
            verticalSpacer(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: CustomColors.whiteColor, shape: BoxShape.circle),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            verticalSpacer(15),
            JobContainer(
              companyName: "Acute Blue Group",
              jobTitle: "Project Manager",
              date: "Thursday May 2, 2024",
              time: "10:00AM",
              imageUrl: ConstantString.blueLogo,
              onTap: onJobTap,
            ),
            verticalSpacer(20),
            JobContainer(
              companyName: "Acute Blue Group",
              jobTitle: "Lead Architect",
              date: "Thursday May 2, 2024",
              time: "10:00AM",
              imageUrl: ConstantString.digitalLogo,
              onTap: onJobTap,
            ),
            verticalSpacer(40),
          ],
        ),
      ),
    );
  }
}
