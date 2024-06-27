import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/back_button.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/models/kid_status/check_in.dart';
import 'package:kindertown_parent_app/models/kid_status/check_out.dart';
import 'package:kindertown_parent_app/models/kid_status/kid_status.dart';
import 'package:kindertown_parent_app/models/kid_status/meal_intake.dart';
import 'package:kindertown_parent_app/models/kid_status/nap.dart';
import 'package:kindertown_parent_app/models/kid_status/photo_status.dart';
import 'package:kindertown_parent_app/models/kid_status/potty.dart';

class KidTimelinePage extends StatefulWidget {
  final KidStatus kidStatus;
  const KidTimelinePage({super.key, required this.kidStatus});

  @override
  State<KidTimelinePage> createState() => _KidTimelinePageState();
}

class _KidTimelinePageState extends State<KidTimelinePage> {
  List<String> selectedActivity = [];
  DateTime? startDate;
  DateTime? endDate;
  late final List<CheckInStatus> checkInList;
  late final List<PottyStatus> pottyList;
  late final List<MealIntakeStatus> mealIntakeList;
  late final List<NapStatus> napList;
  late final List<PhotoStatus> photoList;
  late final List<CheckoutStatus> checkOutList;
  List<CheckInStatus> currentCheckInList = [];
  List<PottyStatus> currentPottyList = [];
  List<MealIntakeStatus> currentMealIntakeList = [];
  List<NapStatus> currentNapList = [];
  List<PhotoStatus> currentPhotoList = [];
  List<CheckoutStatus> currentCheckOutList = [];
  late Map<DateTime, List<Map<String, dynamic>>> dayList;

  List getTodayList(List list) {
    return list
        .where((element) =>
            element.createdAt ==
            DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .toList();
  }

  @override
  void initState() {
    super.initState();
    checkInList = widget.kidStatus.checkIn;
    pottyList = widget.kidStatus.potty;
    mealIntakeList = widget.kidStatus.mealIntake;
    napList = widget.kidStatus.nap;
    photoList = widget.kidStatus.photo;
    checkOutList = widget.kidStatus.checkOut;

    final todayCheckInList = getTodayList(checkInList) as List<CheckInStatus>;
    final todayPottyList = getTodayList(pottyList) as List<CheckInStatus>;
    final todayMealList = getTodayList(mealIntakeList) as List<CheckInStatus>;
    final todayNapList = getTodayList(napList) as List<CheckInStatus>;
    final todayPhotoList = getTodayList(photoList) as List<CheckInStatus>;
    final todayCheckOutList = getTodayList(checkOutList) as List<CheckInStatus>;

    dayList = {
      DateTime.now(): [
        {
          'check_in': todayCheckInList.isEmpty ? null : todayCheckInList.first,
          'potty': todayPottyList.isEmpty ? null : todayPottyList.first,
          'meal_intake': todayMealList.isEmpty ? null : todayMealList.first,
          'nap': todayNapList.isEmpty ? null : todayNapList.first,
          'photo': todayPhotoList.isEmpty ? null : todayPhotoList.first,
          'check_out':
              todayCheckOutList.isEmpty ? null : todayCheckOutList.first,
        }
      ]
    };
  }

  @override
  Widget build(BuildContext context) {
    currentCheckInList = checkInList;
    currentPottyList = pottyList;
    currentMealIntakeList = mealIntakeList;
    currentNapList = napList;
    currentPhotoList = photoList;
    currentCheckOutList = checkOutList;

    if (selectedActivity.isNotEmpty) {
      for (var dayEntry in dayList.entries) {
        for (var status in dayEntry.value) {
          for (var activity in selectedActivity) {
            status[activity] = null;
          }
        }
      }
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: yellowPrimary,
          ),
          Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [],
                  ),
                ),
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryBackButton(),
            ],
          ),
        ],
      ),
    );
  }
}
