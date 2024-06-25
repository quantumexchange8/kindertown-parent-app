import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/models/article.dart';
import 'package:kindertown_parent_app/models/happening_now.dart';
import 'package:kindertown_parent_app/models/kid_status/kid_status.dart';
import 'package:kindertown_parent_app/models/mail.dart';
import 'package:kindertown_parent_app/models/meal_of_the_day.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<Mail> mailList = List<Mail>.empty(growable: true).obs;
  Rxn<KidStatus> kidStatus = Rxn<KidStatus>();
  RxList<HappeningNow> happeningNowList =
      List<HappeningNow>.empty(growable: true).obs;
  RxList<MealOfTheDay> mealOfTheDayList =
      List<MealOfTheDay>.empty(growable: true).obs;
  RxList<Article> articleList = List<Article>.empty(growable: true).obs;

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

  Future<bool> getKidStatus() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/kid_status.json');

      kidStatus.value = KidStatus.fromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> getHappeningNowList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/happening_now.json');
      happeningNowList.value = listHappeningNowFromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> getMealOfTheDayList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/meal_of_the_day.json');
      mealOfTheDayList.value = listMealOfTheDayFromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  Future<bool> getArticles() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/articles.json');
      articleList.value = listArticleFromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
