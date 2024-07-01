import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/content_column.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class ClassActivitiesColumn extends StatelessWidget {
  final List<String> classActivities;
  const ClassActivitiesColumn({super.key, required this.classActivities});

  @override
  Widget build(BuildContext context) {
    return ContentColumn(
        iconAddress: 'assets/icons/kindergarten/activities_icon.png',
        subtitle: 'Class activities',
        content: _classActivitesColumn(classActivities));
  }
}

Column _classActivitesColumn(List<String> classActivities) {
  return Column(
    children: classActivities
        .mapIndexed((i, e) => Padding(
              padding: EdgeInsets.only(
                  bottom: isLast(i, classActivities.length) ? 0 : height24 / 2),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width10 * 1.8, vertical: height24 / 2),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: Color(0xFFF67F00)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          determineIconForActivity(e),
                          height: height10 * 2.8,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(width: width24 / 2),
                        Text(
                          e,
                          style: textMd.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    if (e.toLowerCase().contains('math') ||
                        e.toLowerCase().contains('science'))
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: orangePrimary,
                        size: height24,
                      ),
                  ],
                ),
              ),
            ))
        .toList(),
  );
}

String determineIconForActivity(String activity) {
  final lowerCase = activity.toLowerCase();
  const iconPath = 'assets/icons/class_activities';

  if (lowerCase.contains('arts')) {
    return '$iconPath/arts_icon.png';
  } else if (lowerCase.contains('storytime')) {
    return '$iconPath/storytime_icon.png';
  } else if (lowerCase.contains('outdoor')) {
    return '$iconPath/playground_icon.png';
  } else if (lowerCase.contains('math')) {
    return '$iconPath/math_icon.png';
  } else if (lowerCase.contains('science')) {
    return '$iconPath/chemistry_icon.png';
  } else if (lowerCase.contains('build')) {
    return '$iconPath/building_icon.png';
  } else if (lowerCase.contains('curriculum')) {
    return '$iconPath/curriculum_icon.png';
  } else {
    return 'assets/icons/kindergarten/activities_icon.png';
  }
}
