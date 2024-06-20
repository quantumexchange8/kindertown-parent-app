import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_tickbox.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class SelectableContainer extends StatelessWidget {
  final String text;
  final bool isTick;
  final void Function() onTick;
  const SelectableContainer(
      {super.key,
      required this.text,
      required this.isTick,
      required this.onTick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: redPrimary),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: DottedBorder(
          padding: EdgeInsets.symmetric(
              horizontal: width24 / 2, vertical: height24 / 4),
          strokeWidth: 2,
          color: orangePrimary,
          borderType: BorderType.RRect,
          radius: const Radius.circular(25),
          dashPattern: const [5, 5],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: textLg.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              PrimaryTickBox(
                onTick: onTick,
                isTick: isTick,
              )
            ],
          ),
        ),
      ),
    );
  }
}
