import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class StatusContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  final String? iconAddress;
  const StatusContainer(
      {super.key,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      this.iconAddress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding:
              EdgeInsets.fromLTRB(width08 / 2, height10 / 5, 0, height10 / 5),
          child: Container(
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: DottedBorder(
              color: borderColor,
              borderType: BorderType.RRect,
              radius: const Radius.circular(20),
              dashPattern: const [4, 4],
              padding: EdgeInsets.symmetric(
                  horizontal: height10 * 0.7, vertical: height15 / 5),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: textXS.copyWith(
                  color: borderColor,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ),
        if (iconAddress != null)
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              iconAddress!,
              height: height24,
              fit: BoxFit.fitHeight,
            ),
          ),
      ],
    );
  }
}
