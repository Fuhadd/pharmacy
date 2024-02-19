import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmacy/screens/profile_screen.dart';

import '../constants/custom_colors.dart';
import '../constants/custom_string.dart';
import 'create_job_screen.dart';
import 'general_info_screen.dart';
import 'job_list_screen.dart';
import 'knowledge_screen.dart';
import 'ml_prep_screen.dart';
import 'note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  final int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screenLists = [
      CreateJobScreen(
        onTap: () {
          setState(() {
            index = 1;
          });
        },
      ),
      JobListScreen(
        onTap: () {
          setState(() {
            index = 0;
          });
        },
        onJobTap: () {
          setState(() {
            index = 5;
          });
        },
      ),
      const KnowledgeScreen(),
      const ProfileScreen(),
      const NoteScreen(),
      MlPrepScreen(
        onFowardTap: () {
          setState(() {
            index = 6;
          });
        },
      ),
      const GeneralInfoScreen()
    ];
    return WillPopScope(
      onWillPop: () async {
        return Future.value(false);
      },
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: CustomColors.purpleBgColor,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(),
          ),
          bottomNavigationBar: Stack(
            clipBehavior: Clip.none,
            children: [
              BottomAppBar(
                shadowColor: Colors.black.withOpacity(0.33),
                elevation: 10,
                padding: const EdgeInsets.all(0.0),
                height: 60,
                notchMargin: 5.0,
                color: const Color(0xFF2E2779),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 0;
                          });
                        },
                        child: SvgPicture.asset(
                          ConstantString.homeIcon,
                          height: 20,
                          color: index == 0
                              ? CustomColors.blackColor
                              : CustomColors.whiteColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 35.0, top: 10.0, bottom: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        child: SvgPicture.asset(
                          ConstantString.calendarIcon,
                          height: 20,
                          color: index == 1
                              ? CustomColors.blackColor
                              : CustomColors.whiteColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0, top: 10.0, bottom: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        child: SvgPicture.asset(
                          ConstantString.searchIcon,
                          height: 20,
                          color: index == 2
                              ? CustomColors.blackColor
                              : CustomColors.whiteColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            index = 3;
                          });
                        },
                        child: SvgPicture.asset(
                          ConstantString.profileIcon,
                          height: 20,
                          color: index == 3
                              ? CustomColors.blackColor
                              : CustomColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -15,
                left: (MediaQuery.of(context).size.width - 56) / 2,
                child: Container(
                  width: 56.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFF8C79FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white, width: 5)),
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xFF8C79FF),
                    onPressed: () {
                      setState(() {
                        index = 4;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SvgPicture.asset(
                      ConstantString.messageIcon,
                      height: 18,
                      color: index == 4
                          ? CustomColors.blackColor
                          : CustomColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: screenLists[index],
        ),
      ),
    );
  }
}
