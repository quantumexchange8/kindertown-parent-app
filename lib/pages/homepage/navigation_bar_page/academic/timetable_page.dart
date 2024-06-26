import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/academic/timetable.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimetablePage extends StatefulWidget {
  final List<TimetableData> timetableDataList;
  const TimetablePage({super.key, required this.timetableDataList});

  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  int currentDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    LineStyle lineStyle = const LineStyle(
      color: yellowPrimary,
      thickness: 7,
    );

    final timetableDataList = widget.timetableDataList;

    void onTapLeft() {
      if (currentDayIndex > 0) {
        setState(() {
          currentDayIndex - 1;
        });
      }
    }

    void onTapRight() {
      if (currentDayIndex < (timetableDataList.length - 1)) {
        setState(() {
          currentDayIndex + 1;
        });
      }
    }

    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Timetable',
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      )),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          _dayRow(
              onTapLeft: onTapLeft,
              onTapRight: onTapRight,
              isFirst: currentDayIndex == 0,
              isLast: isLast(currentDayIndex, timetableDataList.length),
              day: timetableDataList[currentDayIndex].day),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(width30, height30, width30, 0),
              itemCount:
                  timetableDataList[currentDayIndex].timetable.entries.length,
              itemBuilder: (context, index) {
                final entry = timetableDataList[currentDayIndex]
                    .timetable
                    .entries
                    .toList()[index];
                return TimelineTile(
                  beforeLineStyle: lineStyle,
                  indicatorStyle: IndicatorStyle(
                      color: yellowPrimary, height: height24, width: height24),
                  afterLineStyle: lineStyle,
                  isLast: isLast(
                      index,
                      timetableDataList[currentDayIndex]
                          .timetable
                          .entries
                          .length),
                  endChild: Padding(
                    padding: EdgeInsets.only(left: width24 / 2),
                    child: _timeColumn(time: entry.key, activity: entry.value),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: height10 * 5)
        ],
      ),
    );
  }
}

Row _dayRow({
  void Function()? onTapLeft,
  void Function()? onTapRight,
  required bool isFirst,
  required bool isLast,
  required String day,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      InkWell(
        onTap: onTapLeft,
        child: Container(
          decoration: BoxDecoration(
              color: isFirst ? const Color(0xFFE0E0E0) : orangePrimary,
              shape: BoxShape.circle),
          child: Icon(
            Icons.arrow_circle_left_outlined,
            size: height10 * 2.8,
            color: yellowPrimary,
          ),
        ),
      ),
      Text(
        day,
        style: textXL.copyWith(
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      InkWell(
        onTap: onTapRight,
        child: Container(
          decoration: BoxDecoration(
              color: isLast ? const Color(0xFFE0E0E0) : orangePrimary,
              shape: BoxShape.circle),
          child: Icon(
            Icons.arrow_circle_left_outlined,
            size: height10 * 2.8,
            color: isLast ? const Color(0xFFC7C7C7) : yellowPrimary,
          ),
        ),
      ),
    ],
  );
}

Column _timeColumn({
  required String time,
  required String activity,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        time,
        style: textXL.copyWith(
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      ),
      SizedBox(
        height: height15,
      ),
      Padding(
        padding: EdgeInsets.only(left: width10),
        child: PrimaryContainer(
          padding: EdgeInsets.symmetric(
              vertical: height24 / 2, horizontal: width08 * 2),
          child: Text(
            activity,
            style: textMd.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.80,
            ),
          ),
        ),
      )
    ],
  );
}
