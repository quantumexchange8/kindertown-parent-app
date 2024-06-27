import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

const List<Map<String, dynamic>> _activityList = [
  {
    'name': 'check_in',
    'icon': 'assets/icons/kid_status/check_in_icon.png',
  },
  {
    'name': 'check_out',
    'icon': 'assets/icons/kid_status/check_out_icon.png',
  },
  {
    'name': 'nap',
    'icon': 'assets/icons/kid_status/sleeping_icon.png',
  },
  {
    'name': 'potty',
    'icon': 'assets/icons/kid_status/toilet_paper_icon.png',
  },
  {
    'name': 'meal_intake',
    'icon': 'assets/icons/kid_status/cereals_icon.png.png',
  },
  {
    'name': 'photo',
    'icon': 'assets/icons/kid_status/camera_icon.png',
  },
  {
    'name': 'absent',
    'icon': 'assets/icons/kid_status/absent_icon.png',
  },
];

class ActivityColumn extends StatelessWidget {
  final void Function(String newActivity) onTapActivity;
  final List<String> selectedActivity;
  const ActivityColumn(
      {super.key, required this.selectedActivity, required this.onTapActivity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Select activity:',
            style: textLg.copyWith(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: height08 * 2),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: width10 * 2.6,
          spacing: height08 * 2,
          children: _activityList
              .map((e) => InkWell(
                    onTap: () {
                      onTapActivity(e['name']);
                    },
                    child: _iconContainer(
                        isSelected: selectedActivity.contains(e['name']),
                        iconAddress: e['icon']),
                  ))
              .toList(),
        )
      ],
    );
  }
}

Widget _iconContainer({required bool isSelected, required String iconAddress}) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 1, right: 3),
        child: Container(
          decoration: const ShapeDecoration(
            color: yellowPrimary,
            shape: OvalBorder(
              side: BorderSide(width: 1.30, color: Colors.white),
            ),
          ),
          child: DottedBorder(
            borderType: BorderType.Circle,
            borderPadding: const EdgeInsets.all(2),
            strokeWidth: 3,
            dashPattern: const [3, 3],
            color: redPrimary,
            padding: EdgeInsets.all(height08),
            child: Image.asset(
              iconAddress,
              height: height10 * 2.6,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
      if (isSelected)
        Align(
          alignment: Alignment.topRight,
          child: Container(
            color: redPrimary,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: height24,
            ),
          ),
        )
    ],
  );
}
