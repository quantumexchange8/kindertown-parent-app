import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class MissionProgressBar extends StatelessWidget {
  final double value;
  const MissionProgressBar({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final BubbleShape dialogShape = BubbleShape(
        position: BubblePosition.Right,
        arrowPositionPercent: 1,
        borderRadius: 20,
        arrowHeight: 10,
        arrowWidth: 4);

    String starDialog;
    if (value == 1) {
      starDialog = 'Yay! Mission Completed!';
    } else if (value < 1) {
      starDialog = 'You’re almost there!';
    } else if (value < 0.5) {
      starDialog = 'Good job! Keep it up!';
    } else {
      starDialog = 'Let’s begin our mission today!';
    }

    return SizedBox(
      width: width100 * 3.96,
      height: height10 * 9.1,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: Offset(0, -3),
                  blurRadius: 5,
                  color: Color(0xFF918D86))
            ]),
            child: ProgressBar(
              value: value,
              backgroundColor: const Color(0xFFD9D9D9),
              width: width100 * 3.66,
              height: height20,
              gradient: const LinearGradient(
                tileMode: TileMode.repeated,
                transform: GradientRotation(300),
                colors: [yellowPrimary, Color(0xFFFDD660)],
              ),
            ),
          ),
          Image.asset(
            'assets/icons/missions/star.png',
            height: height10 * 4.5,
            fit: BoxFit.fitHeight,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: width100),
              child: ClipRect(
                child: Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: yellowPrimary)),
                  child: ShapeOfView(
                    height: height31,
                    width: width100 * 2.1,
                    shape: BubbleShape(
                        position: BubblePosition.Right,
                        arrowPositionPercent: 1,
                        borderRadius: 20,
                        arrowHeight: 10,
                        arrowWidth: 4),
                    child: DottedBorder(
                      customPath: (p0) => dialogShape.generatePath(
                          rect: Rect.fromCenter(
                        center: Offset.zero,
                        height: height31,
                        width: width100 * 2.1,
                      )),
                      borderPadding: const EdgeInsets.all(2),
                      borderType: BorderType.RRect,
                      dashPattern: const [5, 5],
                      strokeWidth: 3,
                      color: redPrimary,
                      child: Center(
                        child: Text(
                          starDialog,
                          style: textMd.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.80,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
