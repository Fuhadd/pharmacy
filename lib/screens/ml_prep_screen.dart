import 'package:flutter/material.dart';

import '../utils/spacers.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/info_container.dart';

class MlPrepScreen extends StatelessWidget {
  final void Function()? onFowardTap;
  const MlPrepScreen({
    super.key,
    required this.onFowardTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const CustomAppBar(
            title: "ML Prep",
          ),
          verticalSpacer(35),
          Expanded(
            child: InfoContainer(
              companyName: "Acute Blue Group",
              jobTitle: "Project Manager",
              onFowardTap: onFowardTap,
              body: const [
                {
                  'Responsibilities': [
                    'Lead the scrum team in Agile',
                    'Facilitate agile ceremonies',
                    'Experience with Salesforce',
                    'Coach teams to improve scrum',
                    'Proficient in Jira',
                    'Strong analytical skills',
                    'Experience building roadmaps'
                  ],
                },
                {
                  'Tools': [
                    'Jira, Github, Slack',
                    'Figma & Miro',
                  ],
                },
              ],
            ),
          ),
          verticalSpacer(20),
        ],
      ),
    );
  }
}
