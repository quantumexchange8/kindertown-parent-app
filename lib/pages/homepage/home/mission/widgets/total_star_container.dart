import 'package:decorated_text/decorated_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class TotalStarContainer extends StatelessWidget {
  final int totalStar;
  final double? scale;
  final bool isClaimable;
  const TotalStarContainer(
      {super.key,
      required this.totalStar,
      this.scale = 1,
      this.isClaimable = true});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: SizedBox(
        width: width100 * 1.24,
        height: height10 * 5.8,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: width100 * 1.05,
                height: height10 * 5.7,
                padding: const EdgeInsets.all(1),
                decoration: ShapeDecoration(
                  color: isClaimable ? yellowPrimary : const Color(0xFFE9E9E9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: ShapeDecoration(
                    color: yellowPrimary,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(25),
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
                  child: DottedBorder(
                    color:
                        isClaimable ? orangePrimary : const Color(0xFFCFCFCF),
                    borderType: BorderType.RRect,
                    dashPattern: const [4, 4],
                    strokeWidth: 3,
                    radius: const Radius.circular(25),
                    child: Container(),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  isClaimable
                      ? 'assets/icons/missions/coin.png'
                      : 'assets/icons/missions/silver_coin.png',
                  height: height10 * 5.8,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: width08,
                ),
                DecoratedGoogleFontText(
                  totalStar.toString(),
                  borderColor: Colors.white,
                  fillColor:
                      isClaimable ? purplePrimary : const Color(0xFFBBBBBB),
                  borderWidth: 2,
                  fontSize: height31,
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
                      wordSpacing}) {
                    return textXXL.copyWith(
                      fontWeight: FontWeight.w700,
                      color: color,
                      fontSize: fontSize,
                      letterSpacing: 1.60,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
