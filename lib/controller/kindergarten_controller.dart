import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:kindertown_parent_app/models/event.dart';
import 'package:kindertown_parent_app/models/kindergarten.dart';
import 'package:kindertown_parent_app/models/programme.dart';

class KindergartenController extends GetxController {
  static KindergartenController instance = Get.find();
  RxList<Kindergarten> kindergartenList =
      List<Kindergarten>.empty(growable: true).obs;

  Future<bool> getKindergartenList() async {
    try {
      final String response = await rootBundle
          .loadString('assets/dummy_data/kindergarten_list.json');
      kindergartenList.value = listKindergartenFromJson(response);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Programme>?> getProgrammeList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/programme_list.json');
      return listProgrammeFromJson(response);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Event>?> getEventList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/event_list.json');
      return listEventFromJson(response);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
