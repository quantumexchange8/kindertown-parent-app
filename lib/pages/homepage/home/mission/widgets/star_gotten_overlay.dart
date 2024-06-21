import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class StarGottenOverlay extends StatelessWidget {
  final bool isFiveStar;
  const StarGottenOverlay({super.key, required this.isFiveStar});

  @override
  Widget build(BuildContext context) {
    String bigTitle = 'HOORAY!';
    Widget subtitle = SizedBox(
      width: width100 * 2.63,
      child: Text(
        'You’ve gotten a star!',
        textAlign: TextAlign.center,
        style: textXXL.copyWith(
          color: Colors.white,
          fontSize: height31,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.60,
        ),
      ),
    );
    Widget? description;
    String imageAddress = 'assets/images/missions/star.png';

    if (isFiveStar) {
      bigTitle = 'SURPRISE!';
      subtitle = SizedBox(
        width: width100 * 2.39,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'You’ve gotten ',
                style: textXXL.copyWith(
                  color: Colors.white,
                  fontSize: height31,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.60,
                ),
              ),
              TextSpan(
                text: 'five',
                style: textXXL.copyWith(
                  color: yellowPrimary,
                  fontSize: height31,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.60,
                ),
              ),
              TextSpan(
                text: ' star',
                style: textXXL.copyWith(
                  color: Colors.white,
                  fontSize: height31,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.60,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      );
      description = SizedBox(
        width: width100 * 2.48,
        child: Text(
          'for keeping up the good work in this week!',
          textAlign: TextAlign.center,
          style: textSm.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.70,
          ),
        ),
      );
    }

    return Dialog.fullscreen(
      backgroundColor: Colors.black.withOpacity(0.85),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width30),
            child: Text(
              bigTitle,
              textAlign: TextAlign.center,
              style: textXXL.copyWith(
                color: yellowPrimary,
                fontSize: height10 * 6.4,
                fontWeight: FontWeight.w900,
                letterSpacing: 3.20,
              ),
            ),
          ),
          subtitle,
          if (description != null) description,
          Image.asset(
            imageAddress,
          )
        ],
      ),
    );
  }
}
