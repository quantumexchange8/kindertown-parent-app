import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class StepContainer extends StatelessWidget {
  final bool isTextLeft;
  final String imageAddress;
  final String text;
  const StepContainer(
      {super.key,
      required this.isTextLeft,
      required this.imageAddress,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width24),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: redPrimary,
        strokeWidth: 3,
        dashPattern: const [1, 1],
        radius: const Radius.circular(21),
        child: Row(
          children: [
            isTextLeft
                ? Text(
                    text,
                    textAlign: TextAlign.left,
                    style: textLg.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  )
                : Image.asset(
                    imageAddress,
                    height: height100 * 1.28,
                    fit: BoxFit.fitHeight,
                  ),
            SizedBox(
              width: width30,
            ),
            isTextLeft
                ? Image.asset(
                    imageAddress,
                    height: height100 * 1.28,
                    fit: BoxFit.fitHeight,
                  )
                : Text(
                    text,
                    textAlign: TextAlign.right,
                    style: textLg.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
