import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class SecondaryPageBackground extends StatelessWidget {
  final Widget? child;
  const SecondaryPageBackground({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          'assets/images/bottom_background.png',
          height: height100 * 4.43,
          width: screenWidth,
          fit: BoxFit.cover,
        ),
      ),
      if (child != null) child!,
    ]);
  }
}
