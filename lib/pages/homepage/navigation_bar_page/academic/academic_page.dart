import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/models/academic/daily_task.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/academic/widgets/daily_task_column.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/academic/widgets/grades_overview_column.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/academic/widgets/skills_assessment_column.dart';

class AcademicPage extends StatefulWidget {
  const AcademicPage({super.key});

  @override
  State<AcademicPage> createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  List<DailyTask> dailyTaskList = academicController.dailyTaskList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height30),
        children: [
          DailyTaskColumn(
              onTick: (dailyTask) {
                setState(() {
                  final newDailyTask = dailyTask;
                  newDailyTask.done = !newDailyTask.done;
                  dailyTaskList[dailyTaskList.indexOf(dailyTask)] =
                      newDailyTask;
                });
              },
              dailyTasks: academicController.dailyTaskList),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height10 * 4.8),
            child: GradesOverviewColumn(
                gradeOverview: academicController.gradeOverview.value!),
          ),
          SkillsAssessmentColumn(
              skillAssessmentList: academicController.skillAssessmentList),
          SizedBox(height: height100 * 1.2)
        ],
      ),
    );
  }
}
