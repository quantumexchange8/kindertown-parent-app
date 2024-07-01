import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class ProgrammeContainer extends StatelessWidget {
  final String iconAddress;
  final String title;
  const ProgrammeContainer(
      {super.key, required this.iconAddress, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: width24, vertical: height10 * 1.8),
      decoration: ShapeDecoration(
        color: Colors.white.withOpacity(0.85),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFF67F00)),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                iconAddress,
                height: height10 * 2.8,
                fit: BoxFit.fitHeight,
              ),
              SizedBox(width: width08 * 2),
              Text(
                title,
                style: textMd.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            color: orangePrimary,
            size: height24,
          ),
        ],
      ),
    );
  }
}
