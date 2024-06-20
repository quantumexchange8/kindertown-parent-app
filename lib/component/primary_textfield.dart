import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final Widget? suffixIcon;
  final bool readOnly;
  final bool obscureText;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
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
      required this.focusNode,
      this.suffixIcon,
      this.readOnly = false,
      this.obscureText = false,
      this.maxLength,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    bool gotError = errorText != null;

    return AnimatedBuilder(
        animation: focusNode,
        builder: (context, child) {
          bool isFocus = focusNode.hasFocus;

          return Container(
            padding: const EdgeInsets.all(1),
            decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                shadows: [
                  if (isFocus)
                    const BoxShadow(
                        color: orangePrimary, blurRadius: 5, spreadRadius: 1)
                ]),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1, color: gotError ? redPrimary : orangePrimary),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: DottedBorder(
                padding: EdgeInsets.symmetric(
                    horizontal: width20, vertical: height08),
                color: gotError
                    ? redPrimary
                    : isFocus
                        ? orangePrimary
                        : yellowPrimary,
                strokeWidth: 3,
                borderType: BorderType.RRect,
                dashPattern: const [5, 5],
                radius: const Radius.circular(25),
                child: TextField(
                  maxLength: maxLength,
                  obscureText: obscureText,
                  readOnly: readOnly,
                  obscuringCharacter: '●',
                  focusNode: focusNode,
                  keyboardType: keyboardType,
                  cursorColor: purplePrimary,
                  controller: controller,
                  style: textLg.copyWith(
                      fontSize: height10 * 1.8, fontWeight: FontWeight.w500),
                  inputFormatters: inputFormatters,
                  decoration: InputDecoration(
                      counterText: '',
                      contentPadding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      isDense: true,
                      hintText: hintText,
                      hintStyle: hintStyle,
                      border: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      prefixText: prefixText,
                      prefixIconConstraints: const BoxConstraints(),
                      prefixStyle: prefixStyle,
                      prefixIcon: prefixIcon,
                      suffixIcon: suffixIcon,
                      suffixIconConstraints: const BoxConstraints()),
                ),
              ),
            ),
          );
        });
  }
}
