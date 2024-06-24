import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/happening_now.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/happening_now_slider.dart';

class NoticePage extends StatelessWidget {
  final List<HappeningNow> happeningNowList;
  const NoticePage({super.key, required this.happeningNowList});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width24, vertical: height30),
      children: [
        ...happeningNowList.mapIndexed((i, e) => Padding(
              padding: EdgeInsets.only(
                  bottom: isLast(i, happeningNowList.length) ? 0 : height24),
              child: happeningNowContainer(e),
            )),
        SizedBox(height: height45),
        Text(
          'End of school events section.',
          textAlign: TextAlign.center,
          style: textMd.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: height100 * 1.68),
      ],
    );
  }
}
