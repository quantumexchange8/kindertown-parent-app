import 'package:dotted_border/dotted_border.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class PrimaryTickbox extends StatelessWidget {
  final VoidCallback onTap;
  final bool isCheck;
  const PrimaryTickbox({super.key, required this.onTap, required this.isCheck});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 2, color: Color(0xFFF67F00)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: DottedBorder(
          borderType: BorderType.RRect,
          color: redPrimary,
          strokeWidth: 2,
          dashPattern: const [4, 4],
          padding: const EdgeInsets.all(2),
          child: SizedBox(
            width: height10 * 1.8,
            height: height10 * 1.8,
            child: Entry.scale(
              visible: isCheck,
              child: Image.asset(
                'assets/icons/missions/red_check.png',
                height: height10 * 1.8,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
