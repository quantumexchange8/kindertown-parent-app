import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/academic/skill_assessment.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/academic/widgets/skill_chart.dart';

class SkillAssessmentPage extends StatelessWidget {
  final List<SkillAssessment> skillAssessments;
  const SkillAssessmentPage({super.key, required this.skillAssessments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Skill assessment',
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      )),
      backgroundColor: backgroundColor,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height30),
        itemCount: skillAssessments.length,
        itemBuilder: (context, index) {
          final skillAssessment = skillAssessments[index];
          return Padding(
              padding: EdgeInsets.only(
                  bottom: isLast(index, skillAssessments.length)
                      ? height100 * 1.47
                      : height24),
              child: _skillAssessmentContainer(skillAssessment));
        },
      ),
    );
  }
}

Widget _skillAssessmentContainer(SkillAssessment skillAssessment) {
  final subs = skillAssessment.subs;

  List<Widget> skillsChildren = [];

  if (subs.isNotEmpty) {
    for (var i = 0; i < subs.length; i += 3) {
      if (i < subs.length) {
        skillsChildren.add(Padding(
          padding:
              EdgeInsets.only(bottom: i + 1 < subs.length ? height20 * 2 : 0),
          child: _subsColumn(
            dotColor: const Color(0xFFF79009),
            skillAssessmentSubs: subs[i],
          ),
        ));
      }
      if ((i + 1) < subs.length) {
        skillsChildren.add(Padding(
          padding:
              EdgeInsets.only(bottom: i + 2 < subs.length ? height20 * 2 : 0),
          child: _subsColumn(
            dotColor: const Color(0xFFF04438),
            skillAssessmentSubs: subs[i + 1],
          ),
        ));
      }
      if ((i + 2) < subs.length) {
        skillsChildren.add(Padding(
          padding:
              EdgeInsets.only(bottom: i + 3 < subs.length ? height20 * 2 : 0),
          child: _subsColumn(
            dotColor: const Color(0xFF2E90FA),
            skillAssessmentSubs: subs[i + 2],
          ),
        ));
      }
    }
  }

  return PrimaryContainer(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: width20, vertical: height30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${skillAssessment.skill} (${skillAssessment.percentage.toStringAsFixed(1)}%)',
          textAlign: TextAlign.center,
          style: textXL.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 1.20,
          ),
        ),
        SizedBox(height: height24),
        SkillChart(
            skillAssessmentsSubs: subs,
            size: Size(height100 * 2.5, height100 * 2.5)),
        SizedBox(height: height31),
        ...skillsChildren,
        SizedBox(height: height20)
      ],
    ),
  );
}

Column _subsColumn(
    {required Color dotColor,
    required SkillAssessmentSubs skillAssessmentSubs}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: height08 / 2),
            child: Container(
              width: height20,
              height: height20,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: width08),
          Expanded(
            child: Text(
              '${skillAssessmentSubs.subtitle} (${skillAssessmentSubs.percentage.round()}%)',
              style: textLg.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: height10),
      ...skillAssessmentSubs.subs.entries.mapIndexed((i, e) => Padding(
            padding: EdgeInsets.only(
                bottom: isLast(i, skillAssessmentSubs.subs.entries.length)
                    ? 0
                    : height10 * 1.1),
            child: _subColumn(e),
          ))
    ],
  );
}

Column _subColumn(MapEntry<String, String> sub) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        sub.key,
        style: textMd.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.80,
        ),
      ),
      SizedBox(height: height10 * 1.1),
      Text(
        sub.value,
        style: textXS.copyWith(
          fontWeight: FontWeight.w500,
          letterSpacing: 0.60,
        ),
      )
    ],
  );
}
