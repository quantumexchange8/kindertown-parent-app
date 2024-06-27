import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class DatePicker extends StatelessWidget {
  final void Function(List<DateTime>)? onValueChanged;
  final DateTime? startDate;
  final DateTime? endDate;
  const DatePicker({
    super.key,
    required this.startDate,
    required this.endDate,
    this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker2(
      config: CalendarDatePicker2Config(
        weekdayLabelTextStyle: textMd.copyWith(
          color: yellowPrimary,
          fontWeight: FontWeight.w700,
          height: 0.07,
          letterSpacing: 0.80,
        ),
        disableModePicker: true,
        controlsHeight: height24,
        controlsTextStyle: textLg.copyWith(
          fontWeight: FontWeight.w700,
          height: 0.06,
          letterSpacing: 1,
        ),
        selectedRangeHighlightColor: const Color(0xFFfdf9fe),
        selectableDayPredicate: (day) => !isWeekend(day),
        dayBuilder: (
            {required date,
            decoration,
            isDisabled,
            isSelected,
            isToday,
            textStyle}) {
          if (isWeekend(date)) {
            return Text(
              date.day.toString(),
              textAlign: TextAlign.center,
              style: textMd.copyWith(
                color: const Color(0xFFB0B0B0),
                fontWeight: FontWeight.w700,
                height: 0.07,
                letterSpacing: 0.80,
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.all(height10),
              decoration: BoxDecoration(
                  color: isSelected != null && isSelected
                      ? const Color(0xFFFAF0FC)
                      : Colors.transparent,
                  shape: BoxShape.circle),
              child: Text(
                date.day.toString(),
                textAlign: TextAlign.center,
                style: textMd.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 0.07,
                  letterSpacing: 0.80,
                ),
              ),
            );
          }
        },
        calendarType: CalendarDatePicker2Type.range,
      ),
      value: [startDate, endDate],
      onValueChanged: onValueChanged,
    );
  }
}
