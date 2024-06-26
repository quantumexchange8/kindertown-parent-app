import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/happening_now.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/happening_now_slider.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/notice/detail_notice_page.dart';

class NoticePage extends StatelessWidget {
  final List<HappeningNow> happeningNowList;
  const NoticePage({super.key, required this.happeningNowList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: width24, vertical: height30),
        children: [
          ...happeningNowList.mapIndexed((i, e) => Padding(
                padding: EdgeInsets.only(
                    bottom: isLast(i, happeningNowList.length) ? 0 : height24),
                child: SizedBox(
                    height: height100 * 3.5,
                    child: happeningNowContainer(
                        onTapSeeMore: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      DetailNoticePage(happeningNow: e)));
                        },
                        happeningNow: e)),
              )),
          SizedBox(height: height45),
          Text(
            'End of school events section.',
            textAlign: TextAlign.center,
            style: textMd.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: height45),
        ],
      ),
    );
  }
}
