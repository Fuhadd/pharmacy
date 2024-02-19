import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../constants/custom_colors.dart';
import '../constants/custom_string.dart';
import '../utils/spacers.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/knowledge_container.dart';

class KnowledgeScreen extends StatelessWidget {
  const KnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FormBuilder(
        key: formKey,
        child: Column(
          children: [
            const CustomAppBar(
              title: "Knowledge",
            ),
            verticalSpacer(30),
            customTextField(
              "",
              hintText: "Search",
            ),
            verticalSpacer(30),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      decoration:
                          const BoxDecoration(color: CustomColors.whiteColor),
                      child: const Center(
                        child: Text(
                          "Process Groups",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    verticalSpacer(10),
                    const KnowledgeContainer(
                      companyName: "Acute Blue Group",
                      jobTitle: "Project Manager",
                      date: "Thursday May 2, 2024",
                      time: "10:00AM",
                      imageUrl: ConstantString.scrumLogo,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpacer(20),
            const CustomButton(
              title: "Submit",
            ),
            verticalSpacer(30),
          ],
        ),
      ),
    );
  }
}
