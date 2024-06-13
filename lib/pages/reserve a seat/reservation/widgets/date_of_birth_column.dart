import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_textfield.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class DateOfBirthColumn extends StatelessWidget {
  final FocusNode dayFocusNode;
  final FocusNode monthFocusNode;
  final FocusNode yearFocusNode;
  final TextEditingController? dayController;
  final TextEditingController? monthController;
  final TextEditingController? yearController;
  const DateOfBirthColumn(
      {super.key,
      required this.dayFocusNode,
      required this.monthFocusNode,
      required this.yearFocusNode,
      this.dayController,
      this.monthController,
      this.yearController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '*Date of birth (DD/MM/YYYY):',
          style: textLg.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          children: [
            Expanded(
                child: PrimaryTextfield(
              controller: dayController,
              focusNode: dayFocusNode,
              maxLength: 2,
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            )),
            SizedBox(
              width: width24 / 2,
            ),
            Expanded(
                child: PrimaryTextfield(
              controller: monthController,
              focusNode: monthFocusNode,
              maxLength: 2,
              keyboardType: const TextInputType.numberWithOptions(),
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            )),
            SizedBox(
              width: width24 / 2,
            ),
            Expanded(
                flex: 2,
                child: PrimaryTextfield(
                  controller: yearController,
                  focusNode: yearFocusNode,
                  maxLength: 4,
                  keyboardType: const TextInputType.numberWithOptions(),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                )),
          ],
        ),
      ],
    );
  }
}
