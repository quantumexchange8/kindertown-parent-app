import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class UnlockedElementOverlay extends StatelessWidget {
  final String elementName;
  final String elementPronounce;
  final String elementDescription;
  final String elementImageAddress;
  const UnlockedElementOverlay(
      {super.key,
      required this.elementName,
      required this.elementPronounce,
      required this.elementDescription,
      required this.elementImageAddress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Dialog.fullscreen(
        backgroundColor: Colors.black.withOpacity(0.7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: width100 * 3.23,
              child: Text(
                'You’ve unlocked a',
                textAlign: TextAlign.center,
                style: textXXL.copyWith(
                  color: Colors.white,
                  fontSize: height31,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.60,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width10),
              child: Text(
                elementName.toUpperCase(),
                textAlign: TextAlign.center,
                style: textXXL.copyWith(
                  color: yellowPrimary,
                  fontSize: height10 * 7,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3.50,
                ),
              ),
            ),
            Text(
              '/$elementPronounce/',
              textAlign: TextAlign.center,
              style: textXL.copyWith(
                color: yellowPrimary,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.20,
              ),
            ),
            SizedBox(
              width: width100 * 2.48,
              child: Text(
                elementDescription,
                textAlign: TextAlign.center,
                style: textSm.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.70,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth,
              height: height100 * 5.23,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      'assets/images/missions/fireworks.png',
                      height: height100 * 4.04,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Image.asset(
                    elementImageAddress,
                    width: width100 * 2.61,
                    height: height100 * 2.9,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
