import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class OnboardingImageStack extends StatelessWidget {
  final String imageAddress;
  final String title;
  final String description;
  const OnboardingImageStack(
      {super.key,
      required this.imageAddress,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(alignment: Alignment.bottomCenter, child: _bottomContainer()),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imageAddress,
              height: height100 * 4,
              fit: BoxFit.fitHeight,
            ),
            Text(
              title,
              style: textXXL.copyWith(
                  fontSize: height10 * 2.6, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: height05,
            ),
            Text(
              description,
              style: textMd.copyWith(color: Colors.black),
            )
          ],
        )
      ],
    );
  }
}

Container _bottomContainer() {
  return Container(
    width: width100 * 3.88,
    height: height100 * 2.8,
    decoration: const ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(150),
          topRight: Radius.circular(150),
          bottomLeft: Radius.circular(21),
          bottomRight: Radius.circular(21),
        ),
      ),
      shadows: [
        BoxShadow(
          color: Color(0x3F000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        )
      ],
    ),
    child: DottedBorder(
        color: const Color(0xFFD62829),
        borderType: BorderType.RRect,
        child: Container()),
  );
}
