import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class BackButton extends StatelessWidget {
  const BackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      splashColor: purplePrimary.withOpacity(0.1),
      constraints: const BoxConstraints(),
      icon: Icon(
        Icons.arrow_back,
        color: purplePrimary,
        size: height10 * 4.1,
      ),
    );
  }
}
