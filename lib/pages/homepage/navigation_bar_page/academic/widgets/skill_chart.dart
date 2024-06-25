import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/models/academic/skill_assessment.dart';

class SkillChart extends StatelessWidget {
  final List<SkillAssessmentSubs> skillAssessmentsSubs;
  final Size size;
  const SkillChart(
      {super.key, required this.skillAssessmentsSubs, required this.size});

  @override
  Widget build(BuildContext context) {
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
                (hasFirstValue
                    ? 100 - skillAssessmentsSubs[i].percentage
                    : 100),
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
        size: size,
        initialChartData: initialChartData,
        chartType: CircularChartType.Radial,
        edgeStyle: SegmentEdgeStyle.round,
        percentageValues: true);
  }
}
