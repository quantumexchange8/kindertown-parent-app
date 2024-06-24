import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';

class SecondaryTickBox extends StatelessWidget {
  final void Function()? onTick;
  final bool isTick;
  const SecondaryTickBox({super.key, this.onTick, this.isTick = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTick,
      child: Stack(
        children: [
          Container(
            width: height20,
            height: height20,
            decoration: BoxDecoration(
              border: Border.all(width: 3, color: orangePrimary),
              shape: BoxShape.circle,
            ),
          ),
          Center(
            child: Entry.scale(
              visible: isTick,
              child: Icon(
                Icons.check_circle,
                color: orangePrimary,
                size: height20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
