import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class HeaderRow extends StatelessWidget {
  final String kindergartenName;
  final String kindergartenLocation;
  final int totalStudent;
  final int maxStudent;
  final bool isLiked;
  const HeaderRow(
      {super.key,
      required this.kindergartenName,
      required this.kindergartenLocation,
      required this.totalStudent,
      required this.maxStudent,
      required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kindergartenName,
              style: textXXL.copyWith(
                color: Colors.white,
                fontSize: height20 * 2,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: height08 / 2),
            Row(
              children: [
                Image.asset(
                  'assets/icons/location_icon.png',
                  height: height24,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: width24 / 2,
                ),
                Text(
                  'Salak South, Kuala Lumpur',
                  style: textXS.copyWith(
                    color: Colors.white,
                    fontSize: height10 * 1.3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: height08 / 2),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/user-02.png',
                  height: height24,
                ),
                SizedBox(width: width08),
                Text(
                  '$totalStudent/$maxStudent',
                  style: textMd.copyWith(
                    color: redPrimary,
                    fontSize: height15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
        Image.asset(
          'assets/icons/kindergarten/liked_${isLiked ? 'active' : 'inactive'}.png',
          height: height10 * 4.7,
          fit: BoxFit.fitHeight,
        )
      ],
    );
  }
}
