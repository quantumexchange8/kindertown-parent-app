import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class TitleColumn extends StatelessWidget {
  final String title;
  final String description;
  const TitleColumn(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: textXXL.copyWith(
            fontSize: height20 * 2,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: height10 * 1.1),
        SizedBox(
          width: width100 * 3.03,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: textMd.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
