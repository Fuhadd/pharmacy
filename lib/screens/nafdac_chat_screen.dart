import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy/constants/custom_string.dart';
import 'package:pharmacy/screens/app_view_model.dart';

import '../constants/custom_colors.dart';
import '../utils/spacers.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class NafdacChatScreen extends StatefulHookConsumerWidget {
  const NafdacChatScreen({
    super.key,
  });

  @override
  ConsumerState<NafdacChatScreen> createState() => _NafdacChatScreenState();
}

class _NafdacChatScreenState extends ConsumerState<NafdacChatScreen> {
  DateTime? selectedDate;

  TimeOfDay? selectedTime;
  List<Map> listViewImages = [
    {
      "title": "Verify",
      "icon": ConstantString.verifyImage,
    },
    {
      "title": "Chat",
      "icon": ConstantString.chatImage,
    },
    {
      "title": "Assess",
      "icon": ConstantString.assetImage,
    },
    {
      "title": "Recovery",
      "icon": ConstantString.recoveryImage,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: FormBuilder(
          key: formKey,
          child: Column(
            children: [
              const CustomAppBar(
                title: "Hi Clinton",
                subtitle: "How are you Today?",
              ),
              verticalSpacer(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      horizontalSpacer(10),
                      Image.asset(
                        ConstantString.nafdac,
                        height: 28,
                      ),
                      horizontalSpacer(15),
                      const Text(
                        "NAFDAC # Verification",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            color: CustomColors.deepBlueColor),
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacer(40),
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.whiteColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    // shrinkWrap: true,
                    // padding: EdgeInsets.zero,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "BOT:",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: CustomColors.deepBlueColor),
                      ),
                      verticalSpacer(10),
                      const Text(
                        "Hello Clinton. Input NAFDAC # for verification.",
                        style: TextStyle(
                            // fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: CustomColors.greyColor),
                      ),
                      ref.watch(nafdacNumberProvider) == null
                          ? const SizedBox(
                              height: 200,
                            )
                          : Column(
                              children: [
                                verticalSpacer(25),
                                Row(
                                  children: [
                                    const Text(
                                      "Clinton: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: CustomColors.deepBlueColor),
                                    ),
                                    Text(
                                      ref.watch(nafdacNumberProvider) ?? "",
                                      style: const TextStyle(
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: CustomColors.greyColor),
                                    ),
                                  ],
                                ),
                                verticalSpacer(25),
                                const Row(
                                  children: [
                                    Text(
                                      "BOT:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: CustomColors.deepBlueColor),
                                    ),
                                  ],
                                ),
                                verticalSpacer(10),
                                const Text(
                                  "The number is for the drug Sudafed Extra with expiration date 12/12/2026. It is for patients with a Cold. Would  you like to track your cold recovery?",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: CustomColors.greyColor),
                                ),
                                verticalSpacer(40),
                              ],
                            ),
                      SizedBox(
                        height: 80,
                        child: customMultiTextField(
                          "nafdacNumber",
                          hintText: "Search",
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.minLength(4,
                                  errorText:
                                      'A valid nafdac number should be greater than 4 characters '),
                            ],
                          ),
                        ),
                      ),
                      verticalSpacer(20),
                      CustomButton(
                        title: "Submit",
                        onTap: () {
                          // FocusScope.of(context).unfocus();
                          // bool? validate = formKey.currentState?.validate();
                          // print(validate);
                          formKey.currentState?.save();
                          var nafdacNumber = formKey
                              .currentState?.fields['nafdacNumber']?.value
                              .toString()
                              .trim();

                          bool validate = (nafdacNumber != "null") &&
                              (nafdacNumber != null) &&
                              (nafdacNumber.isNotEmpty);
                          if (validate) {
                            ref.read(nafdacNumberProvider.notifier).state =
                                nafdacNumber;
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime == null) {
      Fluttertoast.showToast(msg: "Please select a date");
    } else {
      if (pickedTime != selectedTime) {
        setState(() {
          selectedTime = pickedTime;
        });
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime == null) {
      Fluttertoast.showToast(msg: "Please select a date");
    } else {
      if (pickedTime != selectedTime) {
        setState(() {
          selectedTime = pickedTime;
        });
      }
    }
  }

  String getFormattedDate() {
    return DateFormat.yMMMMd().format(selectedDate!);
  }

  String getFormattedTime() {
    if (selectedTime == null) {
      return "Time";
    } else {
      return DateFormat('hh:mm a').format(DateTime(
        2020,
        1,
        1,
        selectedTime!.hour,
        selectedTime!.minute,
      ));
    }
  }
}

class CabinetContainer extends StatelessWidget {
  final String title, imageUrl;
  final bool isExpired;
  final String? subTitle;
  final String? subTitle2;
  const CabinetContainer({
    super.key,
    required this.title,
    required this.imageUrl,
    this.isExpired = false,
    this.subTitle,
    this.subTitle2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomColors.whiteColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Row(
          children: [
            SizedBox(
              height: 70,
              child: Image.asset(imageUrl),
            ),
            horizontalSpacer(15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: CustomColors.deepBlueColor),
                ),
                verticalSpacer(8),

                isExpired
                    ? const Text(
                        "EXPIRED",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: CustomColors.redColor),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subTitle ?? "",
                            style: const TextStyle(
                                // fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: CustomColors.deepBlueColor),
                          ),
                          verticalSpacer(8),
                          Text(
                            subTitle2 ?? "",
                            style: const TextStyle(
                                // fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: CustomColors.lightBlueColor),
                          ),
                        ],
                      ),

                // verticalSpacer(30),
                // CustomButton(
                //   title: "Submit",
                //   onTap: widget.onTap,
                // ),
                // verticalSpacer(20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
