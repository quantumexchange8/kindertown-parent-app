import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/filter_container_widgets/activity_column.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/filter_container_widgets/date_picker.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/filter_container_widgets/select_date_column.dart';

class FilterContainer extends StatefulWidget {
  final List<String> selectedActivity;
  final DateTime? startDate;
  final DateTime? endDate;
  final void Function(
      {required List<String> newSelectedActivity,
      DateTime? newStartDate,
      DateTime? newEndDate}) onPressedApply;
  const FilterContainer(
      {super.key,
      required this.onPressedApply,
      required this.selectedActivity,
      this.startDate,
      this.endDate});

  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  List<String> selectedActivity = [];
  DateTime? startDate;
  DateTime? endDate;
  final FocusNode fromFocus = FocusNode();
  final FocusNode toFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    selectedActivity = widget.selectedActivity;
    startDate = widget.startDate;
    endDate = widget.endDate;
  }

  @override
  Widget build(BuildContext context) {
    bool isDisabled = selectedActivity.isEmpty && startDate == null;

    void onTapActivity(String newActivity) {
      setState(() {
        if (selectedActivity.contains(newActivity)) {
          selectedActivity.remove(newActivity);
        } else {
          selectedActivity.add(newActivity);
        }
      });
    }

    void onPressedApply() {
      if (!isDisabled) {
        widget.onPressedApply(
            newSelectedActivity: selectedActivity,
            newStartDate: startDate,
            newEndDate: endDate);
      }
    }

    void onTapReset() {
      if (!isDisabled) {
        setState(() {
          selectedActivity = [];
          startDate = null;
          endDate = null;
        });
      }
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Color(0xFFFFF8EC),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: height10 * 8.7),
              ActivityColumn(
                  onTapActivity: onTapActivity,
                  selectedActivity: selectedActivity),
              SizedBox(height: height31),
              SelectDateColumn(
                  startDate: startDate,
                  endDate: endDate,
                  fromFocus: fromFocus,
                  toFocus: toFocus),
              SizedBox(height: height20 * 2),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width10 * 1.8),
                child: DatePicker(
                    onValueChanged: (dateTimeList) {
                      if (dateTimeList.isNotEmpty) {
                        setState(() {
                          if (fromFocus.hasFocus) {
                            startDate = dateTimeList.first;
                          }
                          if (toFocus.hasFocus) {
                            endDate = dateTimeList.first;
                          }
                        });
                      }
                    },
                    startDate: startDate,
                    endDate: endDate),
              ),
              SizedBox(height: height10 * 5.3),
              PrimaryTextButton(
                  onPressed: onPressedApply,
                  isDisabled: isDisabled,
                  buttonText: 'Apply'),
              SizedBox(height: height08 * 2),
              InkWell(
                onTap: onTapReset,
                child: Text(
                  'Reset',
                  textAlign: TextAlign.center,
                  style: textMd.copyWith(
                      color:
                          isDisabled ? const Color(0xFFBBBBBB) : orangePrimary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      height: 0.09,
                      letterSpacing: -0.18,
                      decorationColor:
                          isDisabled ? const Color(0xFFBBBBBB) : orangePrimary),
                ),
              ),
              SizedBox(height: height30 * 2)
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: height10 * 6,
              width: width20,
              decoration: BoxDecoration(color: redPrimary, boxShadow: [
                BoxShadow(
                    color: redPrimary,
                    offset: Offset(0, 4),
                    blurStyle: BlurStyle.outer,
                    spreadRadius: 5,
                    blurRadius: 10)
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
