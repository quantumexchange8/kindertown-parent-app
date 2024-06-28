import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/total_star_container.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/unlock_dialog.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/unlocked_element_overlay.dart';

class ElementColumn extends StatelessWidget {
  final String elementPronounce;
  final String elementDescription;
  final bool isUnlocked;
  final String elementName;
  final String silhouetteIcon;
  final String iconAddress;
  final int totalPoint;
  const ElementColumn({
    super.key,
    required this.silhouetteIcon,
    required this.iconAddress,
    required this.totalPoint,
    required this.isUnlocked,
    required this.elementName,
    required this.elementPronounce,
    required this.elementDescription,
  });

  @override
  Widget build(BuildContext context) {
    void onTapClaim() async {
      await showDialog(
        context: context,
        builder: (context) => const UnlockDialog(),
      ).then((value) {
        if (value != null && value) {
          showDialog(
            useSafeArea: false,
            context: context,
            builder: (context) => UnlockedElementOverlay(
                elementName: elementName,
                elementPronounce: elementPronounce,
                elementDescription: elementDescription,
                elementImageAddress: iconAddress),
          );
        }
      });
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: height10 * 6.6),
                  child: Image.asset(
                    'assets/images/missions/land.png',
                    width: width100 * 1.2,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  isUnlocked ? iconAddress : silhouetteIcon,
                  height: height10 * 8.4,
                  width: height10 * 8.4,
                  fit: BoxFit.contain,
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
            : InkWell(
                onTap: onTapClaim,
                child: TotalStarContainer(
                    isClaimable: 131 > totalPoint,
                    scale: 0.5,
                    totalStar: totalPoint),
              )
      ],
    );
  }
}
