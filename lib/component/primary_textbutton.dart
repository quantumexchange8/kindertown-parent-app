import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PrimaryTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final String buttonText;
  final bool isDisabled;
  final Color? dotColor;
  final Color? backgroundColor;
  const PrimaryTextButton(
      {super.key,
      this.isDisabled = false,
      required this.buttonText,
      this.width,
      this.backgroundColor,
      this.onPressed,
      this.dotColor,
      this.height});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: isDisabled ? null : onPressed,
      style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(
              isDisabled ? Colors.transparent : yellowSecondary),
          shadowColor: const MaterialStatePropertyAll(Color(0x3F000000)),
          fixedSize: MaterialStatePropertyAll(
              Size(width ?? width100 * 1.3, height ?? height10 * 4.5)),
          padding: const MaterialStatePropertyAll(EdgeInsets.all(1)),
          backgroundColor: MaterialStatePropertyAll(isDisabled
              ? const Color(0xFFE0E0E0)
              : backgroundColor ?? yellowPrimary),
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
            color: isDisabled
                ? const Color(0xFFE0E0E0)
                : backgroundColor ?? yellowPrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: DottedBorder(
            borderType: BorderType.RRect,
            color: isDisabled
                ? const Color(0xFFCFCFCF)
                : dotColor ?? orangePrimary,
            dashPattern: const [5, 5],
            strokeWidth: 4,
            radius: const Radius.circular(25),
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
