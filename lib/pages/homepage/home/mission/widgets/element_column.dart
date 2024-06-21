import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/total_star_container.dart';

class ElementColumn extends StatelessWidget {
  final bool isUnlocked;
  final String elementName;
  final String silhouetteIcon;
  final String iconAddress;
  final int totalPoint;
  const ElementColumn(
      {super.key,
      required this.silhouetteIcon,
      required this.iconAddress,
      required this.totalPoint,
      required this.isUnlocked,
      required this.elementName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: height100 * 1.3,
          width: width100 * 1.2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  'assets/images/missions/land.png',
                  width: width100 * 1.2,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  isUnlocked ? iconAddress : silhouetteIcon,
                  height: height10 * 8,
                  fit: BoxFit.fitHeight,
                ),
              ),
              if (!isUnlocked)
                Image.asset(
                  'assets/images/missions/padlock.png',
                  height: height10 * 4,
                  fit: BoxFit.fitHeight,
                ),
            ],
          ),
        ),
        SizedBox(
          height: height15,
        ),
        isUnlocked
            ? Text(
                elementName.capitalizeFirst ?? elementName,
                style: textMd.copyWith(
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.80,
                ),
              )
            : TotalStarContainer(scale: 0.5, totalStar: totalPoint)
      ],
    );
  }
}
