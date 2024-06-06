import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_textfield.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class TextlabelWithTextfieldColumn extends StatelessWidget {
  final String textLabel;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextStyle? prefixStyle;
  final String? prefixText;
  final String? errorText;
  const TextlabelWithTextfieldColumn(
      {super.key,
      required this.textLabel,
      this.controller,
      this.hintText,
      this.prefixStyle,
      this.prefixText,
      this.keyboardType,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textLabel,
          style: textLg.copyWith(fontWeight: FontWeight.w700),
        ),
        PrimaryTextfield(
          errorText: errorText,
          controller: controller,
          keyboardType: keyboardType,
          hintText: hintText,
          prefixStyle: prefixStyle,
          prefixText: prefixText,
        ),
        if (errorText != null)
          Padding(
            padding: EdgeInsets.only(left: width08, top: height08),
            child: Text(
              errorText!,
              style:
                  textMd.copyWith(fontSize: height10 * 1.5, color: redPrimary),
            ),
          )
      ],
    );
  }
}
