import 'package:flutter/material.dart';

import '../utils/spacers.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const CustomAppBar(
            title: "Notes",
          ),
          verticalSpacer(35),
          Expanded(
            child: customMultiTextField("name", hintText: "text"),
          ),
          verticalSpacer(20),
          const CustomButton(
            title: "Submit",
          ),
          verticalSpacer(100),
        ],
      ),
    );
  }
}
