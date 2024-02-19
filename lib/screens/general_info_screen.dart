import 'package:flutter/material.dart';

import '../utils/spacers.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/info_container.dart';

class GeneralInfoScreen extends StatelessWidget {
  const GeneralInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const CustomAppBar(
            title: "General Info",
          ),
          verticalSpacer(35),
          const Expanded(
            child: InfoContainer(
              companyName: "Things To Know",
              jobTitle: "Project Manager",
              showFowardIcon: false,
              body: [
                {
                  'Fundamentals': [
                    'Lead the scrum team in Agile',
                    'Facilitate agile ceremonies',
                    'Experience with Salesforce',
                  ],
                },
                {
                  'Technology & Tools': [
                    'Jira, Github, Slack',
                    'Figma & Miro',
                  ],
                },
                {
                  'Questions': [
                    'Examples of project success',
                    'Discuss project contributions',
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
