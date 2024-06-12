import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class PrimaryBackButton extends StatelessWidget {
  final void Function()? onPressed;
  final double? size;
  const PrimaryBackButton({super.key, this.onPressed, this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
      splashColor: purplePrimary.withOpacity(0.1),
      constraints: const BoxConstraints(),
      icon: Icon(
        Icons.arrow_back_rounded,
        color: purplePrimary,
        size: size ?? height10 * 4.1,
      ),
    );
  }
}
