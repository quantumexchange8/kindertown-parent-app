import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PrimaryTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? width;
  final String buttonText;
  final bool isDisabled;
  const PrimaryTextButton(
      {super.key,
      this.isDisabled = false,
      required this.buttonText,
      this.width,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(
              isDisabled ? Colors.transparent : yellowSecondary),
          shadowColor: const MaterialStatePropertyAll(Color(0x3F000000)),
          fixedSize: MaterialStatePropertyAll(
              Size(width ?? width100 * 1.3, height10 * 4.5)),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(1)),
          backgroundColor: MaterialStatePropertyAll(
              isDisabled ? const Color(0xFFE0E0E0) : yellowPrimary),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          )),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Colors.white),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: ShapeDecoration(
            color: isDisabled ? const Color(0xFFE0E0E0) : yellowPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: isDisabled ? const Color(0xFFCFCFCF) : orangePrimary,
            dashPattern: const [2, 2],
            strokeWidth: 4,
            child: Center(
              child: Text(
                buttonText,
                textAlign: TextAlign.center,
                style: textLg.copyWith(
                    fontWeight: FontWeight.w900,
                    color:
                        isDisabled ? const Color(0xFFBBBBBB) : purplePrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
