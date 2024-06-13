import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class StepTitleColumn extends StatelessWidget {
  final int step;
  final String title;
  const StepTitleColumn({super.key, required this.step, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Text(
        'Step $step:\n',
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      Text(
        title,
        textAlign: TextAlign.center,
        style: textXXL.copyWith(
          fontSize: height10 * 2.8,
          fontWeight: FontWeight.w700,
        ),
      ),
    ]);
  }
}
