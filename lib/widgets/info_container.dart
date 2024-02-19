import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/custom_colors.dart';
import '../constants/custom_string.dart';
import '../utils/spacers.dart';

class InfoContainer extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final bool showFowardIcon;
  final List<Map<String, List<String>>> body;
  final void Function()? onFowardTap;
  const InfoContainer({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.body,
    this.showFowardIcon = true,
    this.onFowardTap,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  companyName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
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
            verticalSpacer(15),
            const Divider(
              thickness: 1.05,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  // shrinkWrap: true,
                  itemCount: body.length,
                  itemBuilder: (context, index) {
                    String key = body[index]
                        .keys
                        .elementAt(0); // Get the key at the current index
                    List<String> values = body[index]
                        [key]!; // Get the corresponding list of values

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            key,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          verticalSpacer(5),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: values.map((value) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 8.0),
                                        child: Icon(
                                          Icons.circle,
                                          size: 5,
                                        ),
                                      ),
                                    ),
                                    horizontalSpacer(5),
                                    Text(
                                      value,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        height: 1.8,
                                        color: CustomColors.deepBlueColor,
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(), // Display the list of values
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            verticalSpacer(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: CustomColors.deepPurpleColor,
                      shape: BoxShape.circle),
                  child: Center(
                    child: SvgPicture.asset(
                      ConstantString.chevronLeft,
                      height: 22,
                    ),
                  ),
                ),
                showFowardIcon
                    ? GestureDetector(
                        onTap: onFowardTap,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                              color: CustomColors.deepPurpleColor,
                              shape: BoxShape.circle),
                          child: Center(
                            child: SvgPicture.asset(
                              ConstantString.chevronRight,
                              height: 22,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
