import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class UnderlinedTextButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? textColor;
  const UnderlinedTextButton(
      {super.key, this.onPressed, required this.text, this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textMd.copyWith(
            color: textColor ?? purplePrimary,
            fontSize: height10 * 1.7,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
            decorationColor: textColor ?? purplePrimary),
      ),
    );
  }
}
