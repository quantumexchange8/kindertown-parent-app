import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  const PrimaryContainer(
      {super.key, required this.child, required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(height24 / 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: orangePrimary)),
        child: DottedBorder(
            padding: padding,
            borderType: BorderType.RRect,
            strokeWidth: 3,
            color: redPrimary,
            dashPattern: const [6, 6],
            radius: const Radius.circular(20),
            child: child));
  }
}
