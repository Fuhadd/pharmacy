import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:pharmacy/constants/custom_string.dart';

import '../constants/custom_colors.dart';
import '../utils/spacers.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class CabinetScreen extends StatefulWidget {
  final void Function()? onTap;
  const CabinetScreen({
    super.key,
    required this.onTap,
  });

  @override
  State<CabinetScreen> createState() => _CabinetScreenState();
}

class _CabinetScreenState extends State<CabinetScreen> {
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
          // key: formKey,
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
                        ConstantString.cabinet,
                        height: 28,
                      ),
                      horizontalSpacer(15),
                      const Text(
                        "Cabinet",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            color: CustomColors.deepBlueColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 14, color: CustomColors.blueTextColor),
                      ),
                      horizontalSpacer(2),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: CustomColors.blueTextColor,
                        size: 20,
                      )
                    ],
                  ),
                ],
              ),
              verticalSpacer(40),
              const CabinetContainer(
                title: "Sudafed 500mg",
                subTitle: "One tablet per day",
                subTitle2: "Expected Recovery 9 days",
                imageUrl: ConstantString.sudafed,
              ),
              verticalSpacer(20),
              const CabinetContainer(
                title: "Pepto Bismol Ultra",
                isExpired: true,
                imageUrl: ConstantString.pepto,
              ),
              verticalSpacer(20),
              const CabinetContainer(
                title: "Imodium Multi-Sympton",
                isExpired: true,
                imageUrl: ConstantString.imodium,
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
