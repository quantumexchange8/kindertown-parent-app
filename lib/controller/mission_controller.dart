import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/models/element.dart';
import 'package:kindertown_parent_app/models/mission.dart';

class MissionController extends GetxController {
  static MissionController instance = Get.find();

  Future<List<Mission>?> getMissionList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/missions.json');
      return listMissionFromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<AchievementElement>?> getAchievementElements() async {
    try {
      final String response = await rootBundle
          .loadString('assets/dummy_data/achievement_element.json');
      return listAchievementFromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
