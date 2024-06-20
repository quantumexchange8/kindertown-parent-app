import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/reservation_step_indicator.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/step_title_column.dart';

class ReservationDetailPageLayout extends StatelessWidget {
  final int activeStep;
  final String title;
  final List<Widget> contents;
  final void Function()? onPressedNext;
  final bool isNextDisabled;
  const ReservationDetailPageLayout(
      {super.key,
      required this.activeStep,
      required this.title,
      required this.contents,
      this.onPressedNext,
      required this.isNextDisabled});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: primaryAppbar(
            title: Text(
          'Reservation',
          textAlign: TextAlign.center,
          style: textLg.copyWith(fontWeight: FontWeight.w700),
        )),
        backgroundColor: backgroundColor,
        body: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: width20, vertical: height30),
          children: [
            ReservationStepIndicator(activeStep: activeStep),
            StepTitleColumn(
              step: activeStep + 1,
              title: title,
            ),
            SizedBox(
              height: height30,
            ),
            ...contents.map((e) => e),
            SizedBox(
              height: height30 * 3,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: PrimaryTextButton(
                  onPressed: isNextDisabled ? () {} : onPressedNext,
                  isDisabled: isNextDisabled,
                  buttonText: 'Next'),
            )
          ],
        ),
      ),
    );
  }
}
