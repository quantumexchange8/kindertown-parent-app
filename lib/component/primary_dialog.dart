import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class PrimaryDialog extends StatelessWidget {
  final EdgeInsets padding;
  final Widget child;
  const PrimaryDialog(
      {super.key, required this.child, this.padding = const EdgeInsets.all(2)});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(46)),
      insetPadding: EdgeInsets.symmetric(horizontal: width10 * 5.4),
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(46),
            border: Border.all(color: const Color(0xFFD62829))),
        child: DottedBorder(
          padding: padding,
          radius: const Radius.circular(46),
          borderType: BorderType.RRect,
          color: orangePrimary,
          strokeWidth: 3,
          dashPattern: const [5, 5],
          child: child,
        ),
      ),
    );
  }
}
