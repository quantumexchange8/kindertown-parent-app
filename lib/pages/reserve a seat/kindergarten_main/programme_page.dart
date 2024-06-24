import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/programme.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/about_kindergarten_container.dart';
import 'package:kindertown_parent_app/component/content_column.dart';

class ProgrammePage extends StatelessWidget {
  final Programme programme;
  const ProgrammePage({super.key, required this.programme});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> essentialDetails = {
      'Teacher student ratio': programme.teacherStudentRatio,
      'Student age range': '${programme.studentAgeRange} years old',
      'Student category': programme.studentCategory,
      'Time': programme.time,
      'Billing start on': programme.billingStartOn,
      'Available billing mode': programme.availableBillingMode.entries
          .map((e) => '${e.key}: RM${e.value}\n')
          .join(),
    };

    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Full-day programme',
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
        ),
      )),
      backgroundColor: backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: height30, horizontal: width20),
        children: [
          ContentColumn(
              iconAddress: 'assets/icons/kindergarten/puzzle_icon.png',
              subtitle: 'Programme description',
              content: AboutKindergartenContainer(
                  title: 'Programme description',
                  aboutText: programme.description)),
          SizedBox(
            height: height30,
          ),
          ContentColumn(
              iconAddress: 'assets/icons/kindergarten/essential_details.png',
              subtitle: 'Essential details',
              content: _essentialDetailsContainer(essentialDetails)),
          SizedBox(
            height: height30,
          ),
          ContentColumn(
              iconAddress: 'assets/icons/kindergarten/activities_icon.png',
              subtitle: 'Class activities',
              content: _classActivitesColumn(programme.classActivities)),
          SizedBox(
            height: height100,
          )
        ],
      ),
    );
  }
}

Container _essentialDetailsContainer(Map<String, dynamic> essentialDetails) {
  return Container(
    padding: EdgeInsets.all(height08 / 2),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: orangePrimary),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: DottedBorder(
      strokeWidth: 3,
      color: redPrimary,
      dashPattern: const [5, 5],
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      padding:
          EdgeInsets.symmetric(horizontal: width10, vertical: height24 / 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: essentialDetails.entries
            .map(
              (e) => Padding(
                padding: EdgeInsets.only(bottom: height08),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(height24 / 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAF0FC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e.key,
                        style: textXS.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: height24 / 4),
                      Text(
                        e.value,
                        style: textMd.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ),
  );
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
