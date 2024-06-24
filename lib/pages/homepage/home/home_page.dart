import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/home_info_container.dart';
import 'package:kindertown_parent_app/pages/onboarding/widgets/language_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    final List<Widget?> actionAppBar = [
      null,
      Image.asset(
        'assets/images/academic/timetable.png',
        height: height24,
        fit: BoxFit.fitHeight,
      ),
      null,
      null,
      const LanguageButton(),
    ];
    final List<String> titleAppBar = [
      'Notice',
      'Academic',
      'Home',
      'Payment',
      'Profile'
    ];

    return Scaffold(
      appBar: primaryAppbar(
          isTransparent: currentIndex == 4,
          leading: Icon(
            Icons.menu_rounded,
            color: purplePrimary,
            size: height24,
          ),
          title: Text(
            titleAppBar[currentIndex],
            textAlign: TextAlign.center,
            style: textLg.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            actionAppBar[currentIndex] ??
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Container(
                          color: purplePrimary,
                          child: Icon(
                            Icons.mail_outline,
                            color: Colors.transparent,
                            size: height24,
                          )),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: height08 / 2,
                        width: height08 / 2,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: redPrimary,
                        ),
                      ),
                    )
                  ],
                )
          ]),
      body: ListView(
        children: [
          HomeInfoContainer(status: 'pending_physical_registration'),
        ],
      ),
    );
  }
}
