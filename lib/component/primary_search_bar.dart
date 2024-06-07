import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_textfield.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PrimarySearchBar extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController? controller;
  final String? hintText;
  const PrimarySearchBar(
      {super.key, required this.focusNode, this.controller, this.hintText});

  @override
  Widget build(BuildContext context) {
    return PrimaryTextfield(
      focusNode: focusNode,
      controller: controller,
      hintStyle: textMd.copyWith(
          fontSize: height10 * 1.8,
          color: const Color(0xFF3C0048).withOpacity(0.2)),
      hintText: hintText,
      prefixIcon: Padding(
        padding: EdgeInsets.only(right: width08),
        child: Image.asset(
          'assets/icons/search-refraction.png',
          height: height24,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
