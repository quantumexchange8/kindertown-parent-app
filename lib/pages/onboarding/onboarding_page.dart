import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/pages/onboarding/widgets/language_button.dart';
import 'package:kindertown_parent_app/pages/onboarding/widgets/onboarding_image_stack.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

List<Map<String, dynamic>> onboardingItems = [
  {
    'image': 'assets/images/onboarding_1.png',
    'title': 'Say goodbye to\nenrolment worries',
    'description':
        'You can now secure a seat in your\npreferred kindergarten in KinderTown.'
  },
  {
    'image': 'assets/images/onboarding_2.png',
    'title': 'Know what your kids\nup to in school',
    'description':
        'Stay informed about your kids’\nacademic status, performance and\nmore.'
  },
  {
    'image': 'assets/images/onboarding_3.png',
    'title': 'Never miss a school\nevent or class activity',
    'description': 'Stay in the loop with all the latest\nhappenings in school.'
  },
  {
    'image': 'assets/images/onboarding_4.png',
    'title': 'Pay your school fees\nwith ease',
    'description':
        'Make your school fee payments\ninstantly with only a few clicks.'
  }
];

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentItemIndex = 0;
  final CarouselController _carouselController = CarouselController();
  final PageController _indicatorController = PageController();

  @override
  Widget build(BuildContext context) {
    dynamic onPageChanged(index, reason) {
      setState(() {
        currentItemIndex = index;
      });
      _indicatorController.jumpToPage(index);
    }

    void onDotClicked(index) {
      _carouselController.animateToPage(index);
    }

    void onPressedBack() {
      if (currentItemIndex != 0) {
        _carouselController.previousPage();
        _indicatorController.previousPage(
            duration: const Duration(milliseconds: 200), curve: Curves.linear);
      }
    }

    void onPressedNext() {
      _carouselController.nextPage();
      _indicatorController.nextPage(
          duration: const Duration(milliseconds: 200), curve: Curves.linear);
    }

    void onPressedGetStarted() {}

    return Scaffold(
      body: PrimaryPageBackground(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: width10 * 2.9),
                child: const LanguageButton(),
              ),
            ),
            CarouselSlider.builder(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: height100 * 6,
                onPageChanged: onPageChanged,
              ),
              itemCount: onboardingItems.length,
              itemBuilder: (context, index, realIndex) {
                final item = onboardingItems[index];

                return OnboardingImageStack(
                    imageAddress: item['image'],
                    title: item['title'],
                    description: item['description']);
              },
            ),
            SizedBox(
              height: height45,
            ),
            SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                  dotColor: orangePrimary,
                  dotHeight: height10 * 1.4,
                  dotWidth: height10 * 1.4,
                  spacing: width08 / 2,
                  expansionFactor: 4.5),
              controller: _indicatorController,
              count: onboardingItems.length,
              onDotClicked: onDotClicked,
            ),
            SizedBox(
              height: height10 * 5.8,
            ),
            currentItemIndex < 3
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: width10 * 2.8),
                    child: Row(
                      children: [
                        PrimaryTextButton(
                            onPressed: onPressedBack, buttonText: 'Back'),
                        PrimaryTextButton(
                            onPressed: onPressedNext, buttonText: 'Next')
                      ],
                    ),
                  )
                : PrimaryTextButton(
                    onPressed: onPressedGetStarted, buttonText: 'Get Started')
          ],
        ),
      ),
    );
  }
}
