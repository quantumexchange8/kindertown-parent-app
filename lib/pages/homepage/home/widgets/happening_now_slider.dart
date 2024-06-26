import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/happening_now.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/notice/detail_notice_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HappeningNowSlider extends StatefulWidget {
  final List<HappeningNow> happeningNowList;
  const HappeningNowSlider({super.key, required this.happeningNowList});

  @override
  State<HappeningNowSlider> createState() => _HappeningNowSliderState();
}

class _HappeningNowSliderState extends State<HappeningNowSlider> {
  int activeIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    bool isEmpty = widget.happeningNowList.isEmpty;
    if (isEmpty) {
      return Column(
        children: [
          PrimaryContainer(
              padding: EdgeInsets.all(height15),
              child: Container(
                width: width100 * 3.49,
                height: height100 * 3.15,
                decoration: ShapeDecoration(
                  color: const Color(0x0FAF00D2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    'No data yet.',
                    style: textSm.copyWith(
                      color: const Color(0xFF898A8D),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )),
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
              height: height100 * 3.51,
              viewportFraction: 1,
              autoPlay: true,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
            ),
            itemCount: widget.happeningNowList.length,
            itemBuilder: (context, index, realIndex) {
              final happeningNow = widget.happeningNowList[index];

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width10 * 4),
                child: happeningNowContainer(
                    onTapSeeMore: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailNoticePage(
                                  happeningNow: happeningNow)));
                    },
                    happeningNow: happeningNow),
              );
            },
          ),
          SizedBox(
            height: height10 * 1.8,
          ),
          AnimatedSmoothIndicator(
            activeIndex: activeIndex,
            effect: ExpandingDotsEffect(
              dotColor: yellowPrimary,
              activeDotColor: yellowPrimary,
              dotHeight: height10 * 1.4,
              dotWidth: height10 * 1.4,
              expansionFactor: 4,
              spacing: width08 / 2,
            ),
            count: widget.happeningNowList.length,
            onDotClicked: (index) {
              carouselController.jumpToPage(index);
            },
          )
        ],
      );
    }
  }
}

Widget happeningNowContainer(
    {void Function()? onTapSeeMore, required HappeningNow happeningNow}) {
  return Container(
    clipBehavior: Clip.none,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFF67F00)),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: width100 * 3.85,
            height: height100 * 1.3,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(happeningNow.image),
                fit: BoxFit.cover,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
        DottedBorder(
          stackFit: StackFit.expand,
          borderPadding: const EdgeInsets.all(4),
          color: redPrimary,
          strokeWidth: 3,
          borderType: BorderType.RRect,
          radius: const Radius.circular(20),
          dashPattern: const [6, 6],
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height24 / 2, horizontal: width30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                SizedBox(height: height24 / 2),
                Text(
                  happeningNow.title,
                  style: textLg.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: height10),
                Text(
                  happeningNow.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: textSm.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height08),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: onTapSeeMore,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Read more',
                          style: textSm.copyWith(
                              color: yellowPrimary,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              decorationColor: yellowPrimary),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 21,
                          color: yellowPrimary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
