import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/models/academic/daily_task.dart';
import 'package:kindertown_parent_app/models/academic/grade_overview.dart';
import 'package:kindertown_parent_app/models/academic/skill_assessment.dart';
import 'package:kindertown_parent_app/models/academic/timetable.dart';

class AcademicController extends GetxController {
  static AcademicController instance = Get.find();
  RxList<DailyTask> dailyTaskList = List<DailyTask>.empty(growable: true).obs;
  Rxn<GradeOverview> gradeOverview = Rxn<GradeOverview>();
  RxList<SkillAssessment> skillAssessmentList =
      List<SkillAssessment>.empty(growable: true).obs;

  Future<bool> getDailyTasks() async {
    try {
      final String response = await rootBundle
          .loadString('assets/dummy_data/academic/daily_task.json');
      dailyTaskList.value = listDailyTaskFromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> getGradesOverview() async {
    try {
      final String response = await rootBundle
          .loadString('assets/dummy_data/academic/grades_overview.json');
      gradeOverview.value = GradeOverview.fromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> getSkillsAssesmentList() async {
    try {
      final String response = await rootBundle
          .loadString('assets/dummy_data/academic/skills_assessment.json');
      skillAssessmentList.value = listSkillAssessmentFromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<List<TimetableData>?> getTimetable() async {
    try {
      final String response = await rootBundle
          .loadString('assets/dummy_data/academic/timetable.json');
      return listTimetableFromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
