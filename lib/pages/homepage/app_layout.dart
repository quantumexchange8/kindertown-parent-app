import 'package:fade_indexed_stack/fade_indexed_stack.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/homepage/home/home_page.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/navigation_bottom_bar.dart';
import 'package:kindertown_parent_app/pages/homepage/inbox/inbox_page.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/academic/academic_page.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/notice/notice_page.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/payment/payment_page.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/profile/profile_page.dart';
import 'package:kindertown_parent_app/pages/onboarding/widgets/language_button.dart';

class AppLayout extends StatefulWidget {
  const AppLayout({super.key});

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
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
    final pages = [
      NoticePage(happeningNowList: homeController.happeningNowList),
      const AcademicPage(),
      const HomePage(),
      const PaymentPage(),
      const ProfilePage()
    ];

    void onTapInbox() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const InboxPage(),
          ));
    }

    void onTapItem(int indx) {
      setState(() {
        currentIndex = indx;
      });
    }

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
            style: textLg.copyWith(fontWeight: FontWeight.w700),
          ),
          actions: [
            SizedBox(
              height: height24,
              width: height24,
              child: actionAppBar[currentIndex] ??
                  InkWell(
                    onTap: onTapInbox,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.mail,
                          color: purplePrimary,
                          size: height24,
                        ),
                        if (homeController.mailList
                            .where((p0) => !p0.read)
                            .isNotEmpty)
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: height24 / 4,
                              width: height24 / 4,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: redPrimary,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
            )
          ]),
      body: FadeIndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar:
          NavigationBottomBar(currentIndex: currentIndex, onTapItem: onTapItem),
    );
  }
}
