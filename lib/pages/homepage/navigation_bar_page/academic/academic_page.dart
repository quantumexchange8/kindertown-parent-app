import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/academic/widgets/daily_task_column.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/academic/widgets/grades_overview_column.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/academic/widgets/skills_assessment_column.dart';

class AcademicPage extends StatelessWidget {
  const AcademicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: width20, vertical: height30),
      children: [
        DailyTaskColumn(dailyTasks: academicController.dailyTaskList),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height10 * 4.8),
          child: GradesOverviewColumn(
              gradeOverview: academicController.gradeOverview.value!),
        ),
        SkillsAssessmentColumn(
            skillAssessmentList: academicController.skillAssessmentList),
        SizedBox(height: height100 * 1.2)
      ],
    );
  }
}
