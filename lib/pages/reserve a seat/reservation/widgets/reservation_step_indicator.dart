import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class ReservationStepIndicator extends StatelessWidget {
  final int activeStep;
  const ReservationStepIndicator({super.key, required this.activeStep});

  @override
  Widget build(BuildContext context) {
    List<EasyStep> steps = [];
    for (var i = 0; i < 4; i++) {
      final isActive = activeStep == i;
      final isFinished = i < activeStep;

      steps.add(EasyStep(
        customStep: isActive
            ? Image.asset(
                'assets/icons/active_step.png',
                height: height30,
                fit: BoxFit.fitHeight,
              )
            : Container(
                width: height24,
                height: height24,
                decoration: BoxDecoration(
                  color: isFinished ? yellowPrimary : const Color(0xFFE0E0E0),
                  shape: BoxShape.circle,
                ),
              ),
      ));
    }

    return EasyStepper(
        activeStep: activeStep,
        lineStyle: LineStyle(
            activeLineColor: const Color(0xFFE0E0E0),
            defaultLineColor: const Color(0xFFE0E0E0),
            finishedLineColor: yellowPrimary,
            lineLength: width10 * 6,
            lineThickness: 2.5,
            lineType: LineType.normal),
        steps: steps);
  }
}
