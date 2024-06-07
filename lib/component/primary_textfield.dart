import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PrimaryTextfield extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final String? errorText;
  final Widget? prefixIcon;
  const PrimaryTextfield(
      {super.key,
      this.hintText,
      this.controller,
      this.prefixText,
      this.prefixStyle,
      this.keyboardType,
      this.errorText,
      this.prefixIcon,
      this.hintStyle,
      required this.focusNode});

  @override
  Widget build(BuildContext context) {
    bool gotError = errorText != null;
    bool isFocus = focusNode.hasFocus;

    return Container(
      width: double.infinity,
      height: height10 * 4.5,
      padding: const EdgeInsets.all(1),
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          shadows: [
            if (isFocus)
              const BoxShadow(
                  color: orangePrimary, blurRadius: 20, spreadRadius: 20)
          ]),
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: gotError ? redPrimary : orangePrimary),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: DottedBorder(
          padding: EdgeInsets.symmetric(
              horizontal: width08 * 2, vertical: height08 / 2),
          color: gotError
              ? redPrimary
              : isFocus
                  ? orangePrimary
                  : yellowPrimary,
          strokeWidth: 3,
          borderType: BorderType.RRect,
          dashPattern: const [2, 2],
          child: TextField(
            focusNode: focusNode,
            keyboardType: keyboardType,
            cursorColor: purplePrimary,
            controller: controller,
            style: textLg.copyWith(
                fontSize: height10 * 1.8, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: hintStyle,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                prefixText: prefixText,
                prefixStyle: prefixStyle,
                prefixIcon: prefixIcon),
          ),
        ),
      ),
    );
  }
}
