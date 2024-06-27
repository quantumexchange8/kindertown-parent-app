import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/primary_textfield.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class SelectDateColumn extends StatelessWidget {
  final FocusNode fromFocus;
  final FocusNode toFocus;
  final DateTime? startDate;
  final DateTime? endDate;
  const SelectDateColumn(
      {super.key,
      required this.startDate,
      required this.endDate,
      required this.fromFocus,
      required this.toFocus});

  @override
  Widget build(BuildContext context) {
    String determineDateText(DateTime? date) {
      if (startDate == null && endDate == null) {
        return 'select';
      } else {
        if (startDate != null && endDate != null) {
          return DateFormat('dd MMM, yyyy').format(date!);
        } else {
          return '-';
        }
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Select date:',
          style: textLg.copyWith(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 0.07,
            letterSpacing: -0.22,
          ),
        ),
        SizedBox(height: height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _dateColumn(
                focusNode: fromFocus,
                title: 'From:',
                text: determineDateText(startDate)),
            _dateColumn(
                focusNode: toFocus,
                title: 'To:',
                text: determineDateText(endDate)),
          ],
        )
      ],
    );
  }
}

Widget _dateColumn(
    {required FocusNode focusNode,
    required String title,
    required String text}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: textMd.copyWith(
          fontWeight: FontWeight.w700,
          letterSpacing: 0.80,
        ),
      ),
      SizedBox(height: height08 / 2),
      PrimaryTextfield(
        focusNode: focusNode,
        readOnly: true,
        style: textMd.copyWith(
          color: orangePrimary,
          fontWeight: FontWeight.w700,
          height: 0.07,
          letterSpacing: 0.80,
        ),
        controller: TextEditingController(
          text: text,
        ),
      ),
    ],
  );
}
