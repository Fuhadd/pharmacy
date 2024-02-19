import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../constants/custom_colors.dart';
import '../utils/spacers.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class CreateJobScreen extends StatefulWidget {
  final void Function()? onTap;
  const CreateJobScreen({
    super.key,
    required this.onTap,
  });

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  DateTime? selectedDate;

  TimeOfDay? selectedTime;

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
                title: "Welcome Clinton",
                subtitle: "How are you Today?",
              ),
              verticalSpacer(40),
              customTextField(
                "",
                hintText: "Search",
              ),
              verticalSpacer(40),
              const Row(
                children: [
                  Text(
                    "Create Job Deck",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                    ),
                  ),
                ],
              ),
              verticalSpacer(20),
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Column(
                    children: [
                      customTextField2(
                        "companyName",
                        hintText: "Company Name",
                      ),
                      verticalSpacer(15),
                      customTextField2(
                        "location",
                        hintText: "Location",
                      ),
                      verticalSpacer(15),
                      customTextField2(
                        "jobTitle",
                        hintText: "Job Title",
                      ),
                      verticalSpacer(15),
                      customTextField2(
                        "url",
                        hintText: "URL",
                        suffix: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Text(
                                "(Optional)",
                                style: TextStyle(
                                    color: CustomColors.orangeColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11),
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpacer(15),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  (selectedDate != null && selectedTime != null)
                                      ? '${getFormattedDate()} ${getFormattedTime()}'
                                      : "Time",
                                  style: const TextStyle(
                                      color: CustomColors.greyTextColor,
                                      fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpacer(30),
                      CustomButton(
                        title: "Submit",
                        onTap: widget.onTap,
                      ),
                      verticalSpacer(20),
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
