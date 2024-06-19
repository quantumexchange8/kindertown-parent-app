import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/happening_now.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HappeningNowSlider extends StatelessWidget {
  final List<HappeningNow> happeningNowList;
  final PageController indicatorController;
  final CarouselController carouselController;
  const HappeningNowSlider(
      {super.key,
      required this.happeningNowList,
      required this.indicatorController,
      required this.carouselController});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = happeningNowList.isEmpty;
    if (isEmpty) {
      return Column(
        children: [
          PrimaryContainer(
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: width100 * 3.88,
              height: height100 * 3.51,
            ),
          ),
          SizedBox(
            height: height10 * 1.8,
          ),
          Image.asset(
            'assets/icons/railroad.png',
            width: width100 * 1.62,
            fit: BoxFit.fitWidth,
          )
        ],
      );
    } else {
      return Column(
        children: [
          CarouselSlider.builder(
            carouselController: carouselController,
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                indicatorController.jumpToPage(
                  index,
                );
              },
            ),
            itemCount: happeningNowList.length,
            itemBuilder: (context, index, realIndex) {
              final happeningNow = happeningNowList[index];

              return _happeningNowContainer(happeningNow);
            },
          ),
          SizedBox(
            height: height10 * 1.8,
          ),
          SmoothPageIndicator(
            effect: ExpandingDotsEffect(
              dotColor: yellowPrimary,
              dotHeight: height10 * 1.4,
              dotWidth: height10 * 1.4,
              expansionFactor: 4,
              spacing: width08 / 2,
            ),
            count: happeningNowList.length,
            controller: indicatorController,
            onDotClicked: (index) {
              carouselController.jumpToPage(index);
            },
          )
        ],
      );
    }
  }
}

Widget _happeningNowContainer(HappeningNow happeningNow) {
  return Container(
    width: width100 * 3.88,
    height: height100 * 3.51,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFF67F00)),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: width100 * 3.85,
            height: height100 * 1.3,
            decoration: const ShapeDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/event/happening_now.png"),
                fit: BoxFit.cover,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        DottedBorder(
          borderPadding: const EdgeInsets.all(2),
          color: redPrimary,
          strokeWidth: 3,
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          dashPattern: const [4, 4],
          child: Container(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: width10 * 6.6,
                    height: height24,
                    decoration: ShapeDecoration(
                      color: yellowPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        DateFormat('dd/MM').format(happeningNow.startDate),
                        style: textXS.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    DateFormat('H:mma').format(happeningNow.startDate),
                    textAlign: TextAlign.right,
                    style: textXS.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                happeningNow.title,
                style: textLg.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: height10),
              Text(
                happeningNow.description,
                style: textSm.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Read more',
                    style: textSm.copyWith(
                      color: yellowPrimary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 21,
                    color: yellowPrimary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
