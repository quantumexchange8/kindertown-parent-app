import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/content_column.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/academic/skill_assessment.dart';

class SkillsAssessmentColumn extends StatelessWidget {
  final List<SkillAssessment> skillAssessmentList;
  const SkillsAssessmentColumn({super.key, required this.skillAssessmentList});

  @override
  Widget build(BuildContext context) {
    return ContentColumn(
        iconAddress: 'assets/images/academic/skill_development.png',
        subtitle: 'Skills assessment',
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: skillAssessmentList
              .mapIndexed((i, e) => Padding(
                  padding: EdgeInsets.only(bottom: height20),
                  child: _skillContainer(e)))
              .toList(),
        ));
  }
}

Row _subsRow({
  required Color dotColor,
  required String subtitle,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: height24 / 2,
        height: height24 / 2,
        decoration: ShapeDecoration(color: dotColor, shape: const OvalBorder()),
      ),
      SizedBox(width: width08),
      Text(
        subtitle,
        style:
            textXS.copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.60),
      ),
    ],
  );
}

Widget _skillContainer(SkillAssessment skillAssessment) {
  List<SkillAssessmentSubs> subs = skillAssessment.subs;

  List<Widget> skillsChildren = [];

  if (subs.isNotEmpty) {
    for (var i = 0; i < subs.length; i++) {
      if (i < subs.length) {
        skillsChildren.add(
          _subsRow(
            dotColor: const Color(0xFFF79009),
            subtitle: subs[i].subtitle,
          ),
        );
      }
      if ((i + 1) < subs.length) {
        skillsChildren.add(
          _subsRow(
            dotColor: const Color(0xFFF04438),
            subtitle: subs[i + 1].subtitle,
          ),
        );
      }
      if ((i + 2) < subs.length) {
        skillsChildren.add(
          _subsRow(
            dotColor: const Color(0xFF2E90FA),
            subtitle: subs[i + 2].subtitle,
          ),
        );
      }
    }
  }

  return PrimaryContainer(
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: height24, horizontal: width08 * 2),
    child: Row(
      children: [
        _skillChart(skillAssessment.subs),
        SizedBox(width: width20),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${skillAssessment.skill} (${skillAssessment.percentage}%)',
              style: textMd.copyWith(
                  fontWeight: FontWeight.w700, letterSpacing: 0.80),
            ),
            ...skillsChildren,
          ],
        )
      ],
    ),
  );
}

Widget _skillChart(List<SkillAssessmentSubs> skillAssessmentsSubs) {
  List<CircularStackEntry> initialChartData = [];

  if (skillAssessmentsSubs.isNotEmpty) {
    for (var i = 0; i < skillAssessmentsSubs.length; i += 3) {
      bool hasFirstValue = i < skillAssessmentsSubs.length;
      bool hasSecondValue = (i + 1) < skillAssessmentsSubs.length;
      bool hasThirdValue = (i + 2) < skillAssessmentsSubs.length;

      initialChartData.add(
        CircularStackEntry(
          [
            if (hasFirstValue)
              CircularSegmentEntry(
                skillAssessmentsSubs[i].percentage,
                const Color(0xFFF79009),
              ),
            CircularSegmentEntry(
              (hasFirstValue ? 100 - skillAssessmentsSubs[i].percentage : 100),
              const Color(0xFFFEF0C7),
            ),
          ],
        ),
      );
      initialChartData.add(
        CircularStackEntry(
          [
            if (hasSecondValue)
              CircularSegmentEntry(
                skillAssessmentsSubs[i + 1].percentage,
                const Color(0xFFF04438),
              ),
            CircularSegmentEntry(
              (hasSecondValue
                  ? 100 - skillAssessmentsSubs[i + 1].percentage
                  : 100),
              const Color(0xFFFEE4E2),
            ),
          ],
        ),
      );
      initialChartData.add(
        CircularStackEntry(
          [
            if (hasThirdValue)
              CircularSegmentEntry(
                skillAssessmentsSubs[i + 2].percentage,
                const Color(0xFF2E90FA),
              ),
            CircularSegmentEntry(
              (hasThirdValue
                  ? 100 - skillAssessmentsSubs[i + 2].percentage
                  : 100),
              const Color(0xFFD1E9FF),
            ),
          ],
        ),
      );
    }
  }

  return AnimatedCircularChart(
    size: Size(height100 * 1.25, height100 * 1.25),
    initialChartData: initialChartData,
    chartType: CircularChartType.Radial,
    edgeStyle: SegmentEdgeStyle.round,
    percentageValues: true,
  );
}
