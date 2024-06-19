import 'package:decorated_text/decorated_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class CheckedInContainer extends StatelessWidget {
  final double temp;
  final DateTime checkInTime;
  final String gender;
  const CheckedInContainer(
      {super.key,
      required this.temp,
      required this.checkInTime,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    String background;
    String bubble;
    String kidImage;
    Color borderColor;
    Color shadowColor;

    if (temp >= 36.4 && temp <= 37.4) {
      background = 'assets/images/kid_status/normal_temp_background.png';
      bubble = 'assets/images/kid_status/normal_temp_bubble.png';
      borderColor = const Color(0xFF479138);
      shadowColor = const Color(0xFFE0F6E5);

      if (gender.toLowerCase() == 'boy') {
        kidImage = 'assets/images/kid_status/boy_normal_temp.png';
      } else {
        kidImage = 'assets/images/kid_status/girl_normal_temp.png';
      }
    } else if (temp >= 37.5 && temp <= 37.9) {
      background = 'assets/images/kid_status/slightly_high_temp_background.png';
      bubble = 'assets/images/kid_status/slightly_high_temp_bubble.png';
      borderColor = orangePrimary;
      shadowColor = const Color(0xFFFFF2E4);

      if (gender.toLowerCase() == 'boy') {
        kidImage = 'assets/images/kid_status/boy_slightly_high_temp.png';
      } else {
        kidImage = 'assets/images/kid_status/girl_slightly_high_temp.png';
      }
    } else {
      background = 'assets/images/kid_status/high_temp_background.png';
      bubble = 'assets/images/kid_status/high_temp_bubble.png';
      borderColor = redPrimary;
      shadowColor = const Color(0xFFFFD9D9);

      if (gender.toLowerCase() == 'boy') {
        kidImage = 'assets/images/kid_status/boy_high_temp.png';
      } else {
        kidImage = 'assets/images/kid_status/girl_high_temp.png';
      }
    }

    return SizedBox(
      width: width100 * 3.89,
      height: height100 * 1.61,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width100 * 3.89,
            height: height100 * 1.24,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFF3C0048)),
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
              child: DottedBorder(
                color: borderColor,
                borderType: BorderType.RRect,
                radius: const Radius.circular(21),
                dashPattern: const [3, 3],
                strokeWidth: 3,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        background,
                        width: width100 * 1.96,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width20),
                        child: Image.asset(
                          bubble,
                          width: width100 * 1.81,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'checked-in:',
                                    style: textXXS.copyWith(
                                      color: borderColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    DateFormat('H:mma').format(checkInTime),
                                    style: textMd.copyWith(
                                      color: borderColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: width08),
                              Container(
                                width: width10 * 7.1,
                                height: height10 * 2.1,
                                decoration: ShapeDecoration(
                                  color: shadowColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 2.10,
                                      offset: Offset(0, 2),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Text(
                                  'in class',
                                  style: textSm.copyWith(
                                    color: borderColor,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          DecoratedGoogleFontText(
                            '$temp°C',
                            borderColor: borderColor,
                            borderWidth: 3,
                            fillColor: Colors.white,
                            fontSize: height10 * 4.8,
                            shadows: [
                              Shadow(
                                color: shadowColor,
                                blurRadius: 10,
                              )
                            ],
                            fontWeight: FontWeight.w700,
                            fontMethod: (
                                    {background,
                                    backgroundColor,
                                    color,
                                    decoration,
                                    decorationColor,
                                    decorationStyle,
                                    decorationThickness,
                                    fontFeatures,
                                    fontSize,
                                    fontStyle,
                                    fontWeight,
                                    foreground,
                                    height,
                                    letterSpacing,
                                    locale,
                                    shadows,
                                    textBaseline,
                                    textStyle,
                                    wordSpacing}) =>
                                textXXL.copyWith(
                              letterSpacing: 2.40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              kidImage,
              height: height100 * 1.6,
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
    );
  }
}
