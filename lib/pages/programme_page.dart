import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/programme.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/about_kindergarten_container.dart';
import 'package:kindertown_parent_app/component/content_column.dart';
import 'package:kindertown_parent_app/pages/widgets/class_activities_column.dart';
import 'package:kindertown_parent_app/pages/widgets/subscribe_bottom_bar.dart';

class ProgrammePage extends StatelessWidget {
  final Programme programme;
  final bool subscribed;
  const ProgrammePage(
      {super.key, required this.programme, this.subscribed = true});

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

    void onPressedSubscribe() {}

    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        programme.name,
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
              content: ClassActivitiesColumn(
                  classActivities: programme.classActivities)),
          SizedBox(
            height: height100,
          )
        ],
      ),
      bottomNavigationBar: subscribed
          ? null
          : SubscribeBottomBar(
              onPressedSubscribe: onPressedSubscribe,
              fee: programme.fee,
              buttonText: 'Subscribe Now'),
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
