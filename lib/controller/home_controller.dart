import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/models/happening_now.dart';
import 'package:kindertown_parent_app/models/mail.dart';
import 'package:kindertown_parent_app/models/meal_of_the_day.dart';
import 'package:kindertown_parent_app/models/mission.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList mailList = List<Mail>.empty(growable: true).obs;

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

  Future<List<HappeningNow>?> getHappeningNowList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/happening_now.json');
      return listHappeningNowFromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<List<MealOfTheDay>?> getMealOfTheDayList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/meal_of_the_day.json');
      return listMealOfTheDayFromJson(response);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  Future<bool> getMailList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/mails.json');

      mailList.value = listMailFromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
