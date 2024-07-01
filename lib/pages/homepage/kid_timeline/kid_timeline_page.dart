import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/back_button.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/kid_status/check_in.dart';
import 'package:kindertown_parent_app/models/kid_status/check_out.dart';
import 'package:kindertown_parent_app/models/kid_status/kid_status.dart';
import 'package:kindertown_parent_app/models/kid_status/meal_intake.dart';
import 'package:kindertown_parent_app/models/kid_status/nap.dart';
import 'package:kindertown_parent_app/models/kid_status/photo_status.dart';
import 'package:kindertown_parent_app/models/kid_status/potty.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/filter_container.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/check_in_row.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/check_out_row.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/meal_intake_row.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/nap_row.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/photo_status_row.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/potty_row.dart';
import 'package:kindertown_parent_app/pages/homepage/widgets/profile_info_column.dart';

class KidTimelinePage extends StatefulWidget {
  final KidStatus kidStatus;
  const KidTimelinePage({super.key, required this.kidStatus});

  @override
  State<KidTimelinePage> createState() => _KidTimelinePageState();
}

class _KidTimelinePageState extends State<KidTimelinePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<String> selectedActivity = [];
  DateTime? startDate;
  DateTime? endDate;
  late final List<CheckInStatus> checkInList;
  late final List<PottyStatus> pottyList;
  late final List<MealIntakeStatus> mealIntakeList;
  late final List<NapStatus> napList;
  late final List<PhotoStatus> photoList;
  late final List<CheckoutStatus> checkOutList;
  late Map<DateTime, Map<String, dynamic>> dayList;

  List getTodayList(List list) {
    return list
        .where((element) =>
            element.createdAt ==
            DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day))
        .toList();
  }

  List getADayList({required List list, required DateTime day}) {
    return list
        .where((element) =>
            element.createdAt == DateTime(day.year, day.month, day.day))
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
    final todayPottyList = getTodayList(pottyList) as List<PottyStatus>;
    final todayMealList =
        getTodayList(mealIntakeList) as List<MealIntakeStatus>;
    final todayNapList = getTodayList(napList) as List<NapStatus>;
    final todayPhotoList = getTodayList(photoList) as List<PhotoStatus>;
    final todayCheckOutList =
        getTodayList(checkOutList) as List<CheckoutStatus>;

    dayList = {
      DateTime.now(): {
        'check_in': todayCheckInList.isEmpty ? null : todayCheckInList.first,
        'potty': todayPottyList.isEmpty ? null : todayPottyList.first,
        'meal_intake': todayMealList.isEmpty ? null : todayMealList.first,
        'nap': todayNapList.isEmpty ? null : todayNapList.first,
        'photo': todayPhotoList.isEmpty ? null : todayPhotoList.first,
        'check_out': todayCheckOutList.isEmpty ? null : todayCheckOutList.first,
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    if (selectedActivity.isNotEmpty) {
      for (var dayEntry in dayList.entries) {
        for (var status in dayEntry.value.entries) {
          for (var activity in selectedActivity) {
            if (activity == status.key) {
              dayList[dayEntry.key]![status.key] = null;
            }
          }
        }
      }
    }

    if (startDate != null) {
      if (endDate != null) {
        final List<DateTime> rangeDate = getDateRange(startDate!, endDate!);
        dayList = {};
        for (var date in rangeDate) {
          final dayCheckInList =
              getADayList(list: checkInList, day: date) as List<CheckInStatus>;
          final dayPottyList =
              getADayList(list: pottyList, day: date) as List<PottyStatus>;
          final dayMealList = getADayList(list: mealIntakeList, day: date)
              as List<MealIntakeStatus>;
          final dayNapList =
              getADayList(list: napList, day: date) as List<NapStatus>;
          final dayPhotoList =
              getADayList(list: photoList, day: date) as List<PhotoStatus>;
          final dayCheckOutList = getADayList(list: checkOutList, day: date)
              as List<CheckoutStatus>;

          dayList.addAll({
            date: {
              'check_in': dayCheckInList.isEmpty ? null : dayCheckInList.first,
              'potty': dayPottyList.isEmpty ? null : dayPottyList.first,
              'meal_intake': dayMealList.isEmpty ? null : dayMealList.first,
              'nap': dayNapList.isEmpty ? null : dayNapList.first,
              'photo': dayPhotoList.isEmpty ? null : dayPhotoList.first,
              'check_out':
                  dayCheckOutList.isEmpty ? null : dayCheckOutList.first,
            }
          });
        }
      } else {
        final dayCheckInList = getADayList(list: checkInList, day: startDate!)
            as List<CheckInStatus>;
        final dayPottyList =
            getADayList(list: pottyList, day: startDate!) as List<PottyStatus>;
        final dayMealList = getADayList(list: mealIntakeList, day: startDate!)
            as List<MealIntakeStatus>;
        final dayNapList =
            getADayList(list: napList, day: startDate!) as List<NapStatus>;
        final dayPhotoList =
            getADayList(list: photoList, day: startDate!) as List<PhotoStatus>;
        final dayCheckOutList = getADayList(list: checkOutList, day: startDate!)
            as List<CheckoutStatus>;
        dayList = {
          startDate!: {
            'check_in': dayCheckInList.isEmpty ? null : dayCheckInList.first,
            'potty': dayPottyList.isEmpty ? null : dayPottyList.first,
            'meal_intake': dayMealList.isEmpty ? null : dayMealList.first,
            'nap': dayNapList.isEmpty ? null : dayNapList.first,
            'photo': dayPhotoList.isEmpty ? null : dayPhotoList.first,
            'check_out': dayCheckOutList.isEmpty ? null : dayCheckOutList.first,
          }
        };
      }
    }

    void onPressedApply(
        {DateTime? newEndDate,
        required List<String> newSelectedActivity,
        DateTime? newStartDate}) {
      _scaffoldKey.currentState!.closeDrawer();
      setState(() {
        selectedActivity = newSelectedActivity;
        startDate = newStartDate;
        endDate = newEndDate;
      });
    }

    void onTapHistory() {
      _scaffoldKey.currentState!.openDrawer();
    }

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: FilterContainer(
          selectedActivity: selectedActivity,
          startDate: startDate,
          endDate: endDate,
          onPressedApply: onPressedApply),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: yellowPrimary,
          ),
          SingleChildScrollView(
            padding: EdgeInsetsDirectional.only(top: height100 * 1.2),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height100),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: ListView(
                      padding: EdgeInsets.symmetric(horizontal: width30),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        SizedBox(height: height100 * 2),
                        ...dayList.entries.mapIndexed((i, e) => Padding(
                              padding: EdgeInsets.only(
                                  bottom: isLast(i, dayList.entries.length)
                                      ? 0
                                      : height10 * 5),
                              child: _aDayTimeline(e),
                            )),
                        SizedBox(height: height10 * 8.6),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ProfileInfoColumn(
                      gender: widget.kidStatus.gender,
                      name: widget.kidStatus.name,
                      kindergartenName: widget.kidStatus.kindergartenName),
                )
              ],
            ),
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryBackButton(),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onTapHistory,
                  child: Image.asset(
                    'assets/icons/kid_status/history_icon.png',
                    width: width10 * 8.6,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _aDayTimeline(MapEntry<DateTime, Map<String, dynamic>> dayListEntry) {
  bool checkIsLast(List<String> key) {
    List<Map<String, dynamic>> listNotNull = [];

    for (var element in dayListEntry.value.entries) {
      if (!key.contains(element.key)) {
        if (element.value != null) {
          listNotNull.add(element.value);
        }
      }
    }

    return listNotNull.isEmpty;
  }

  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        DateFormat('d MMM yyyy').format(dayListEntry.key),
        style: textLg.copyWith(
          color: yellowPrimary,
          fontWeight: FontWeight.w900,
          height: 0,
        ),
      ),
      SizedBox(height: height31),
      if (dayListEntry.value['check_in'] != null)
        CheckInRow(
            checkInStatus: dayListEntry.value['check_in'],
            isLast: checkIsLast(['check_in'])),
      if (dayListEntry.value['potty'] != null)
        PottyRow(
            pottyStatus: dayListEntry.value['potty'],
            isLast: checkIsLast(['check_in', 'potty'])),
      if (dayListEntry.value['meal_intake'] != null)
        MealInTakeRow(
            mealIntakeStatus: dayListEntry.value['meal_intake'],
            isLast: checkIsLast(['check_in', 'potty', 'meal_intake'])),
      if (dayListEntry.value['nap'] != null)
        NapRow(
            napStatus: dayListEntry.value['nap'],
            isLast: checkIsLast(['check_in', 'potty', 'meal_intake', 'nap'])),
      if (dayListEntry.value['photo'] != null)
        PhotoStatusRow(
            photoStatus: dayListEntry.value['photo'],
            isLast: checkIsLast(
                ['check_in', 'potty', 'meal_intake', 'nap', 'photo'])),
      if (dayListEntry.value['check_out'] != null)
        CheckoutRow(
            checkoutStatus: dayListEntry.value['check_out'], isLast: true),
    ],
  );
}
