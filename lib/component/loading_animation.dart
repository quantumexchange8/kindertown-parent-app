import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:simple_animations/animation_builder/loop_animation_builder.dart';

class PrimaryLoadingAnimation extends StatelessWidget {
  const PrimaryLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return LoopAnimationBuilder<int>(
      tween: Tween(begin: 0, end: 4),
      duration: const Duration(milliseconds: 500),
      builder: (context, value, _) {
        List<String> dotList = [];

        for (var i = 0; i < value; i++) {
          dotList.add('.');
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                width: height10 * 6.4,
                height: height10 * 6.4,
                child: value != 0
                    ? Image.asset('assets/icons/loading/block_$value.png',
                        fit: BoxFit.contain)
                    : null),
            SizedBox(height: height30),
            Text(
              'Loading${dotList.join()}',
              style: textLg.copyWith(
                fontWeight: FontWeight.w900,
                height: 0,
              ),
            ),
          ],
        );
      },
    );
  }
}
