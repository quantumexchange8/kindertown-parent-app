import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class PrimaryIconButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? iconSize;
  final dynamic icon;
  final bool isDisabled;
  final Color? iconColor;
  const PrimaryIconButton(
      {super.key,
      this.onPressed,
      this.iconSize,
      required this.icon,
      this.isDisabled = false,
      this.iconColor});

  @override
  Widget build(BuildContext context) {
    Widget iconWidget;
    if (icon is IconData) {
      iconWidget = Icon(
        icon,
        size: iconSize ?? height10 * 2.6,
        color:
            iconColor ?? (isDisabled ? const Color(0xFFBBBBBB) : purplePrimary),
      );
    } else if (icon is String) {
      iconWidget = Image.asset(
        icon,
        height: iconSize ?? height10 * 2.6,
        fit: BoxFit.fitHeight,
      );
    } else {
      iconWidget = Container();
    }

    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
          overlayColor: MaterialStatePropertyAll(
              isDisabled ? Colors.transparent : yellowSecondary),
          shadowColor: const MaterialStatePropertyAll(Color(0x3F000000)),
          minimumSize: const MaterialStatePropertyAll(Size.zero),
          maximumSize: const MaterialStatePropertyAll(Size.infinite),
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
            padding: EdgeInsets.all(height08 / 2),
            borderType: BorderType.RRect,
            color: isDisabled ? const Color(0xFFCFCFCF) : orangePrimary,
            dashPattern: const [2, 2],
            strokeWidth: 4,
            child: Center(
              child: iconWidget,
            ),
          ),
        ),
      ),
    );
  }
}
