import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/models/bill.dart';

class PaymentController extends GetxController {
  static PaymentController instance = Get.find();
  RxList<Bill> billList = List<Bill>.empty(growable: true).obs;

  Future<bool> getBillList() async {
    try {
      final String response =
          await rootBundle.loadString('assets/dummy_data/bills_history.json');
      billList.value = listBillFromJson(response);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
