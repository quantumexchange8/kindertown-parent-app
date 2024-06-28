import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/back_button.dart';
import 'package:kindertown_parent_app/component/secondary_page_background.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/element.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/element_column.dart';

class YourArchivementPage extends StatelessWidget {
  final List<AchievementElement> achiveElements;
  const YourArchivementPage({super.key, required this.achiveElements});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SecondaryPageBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryBackButton(size: height24),
                SizedBox(height: height10 * 4.1),
                Text(
                  'Your achievement',
                  textAlign: TextAlign.right,
                  style: textXXL.copyWith(
                    fontSize: height31,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.60,
                  ),
                ),
                Text(
                  'Complete ‘Mission of the Day’ to unlock more elements.',
                  style: textXS.copyWith(
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.60,
                  ),
                ),
                SizedBox(height: height10 * 6),
                Expanded(
                  child: GridView.builder(
                    itemCount: achiveElements.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: width24 / 2,
                        mainAxisSpacing: height10 * 9,
                        mainAxisExtent: height100 * 1.6,
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final element = achiveElements[index];

                      return ElementColumn(
                          elementDescription: element.description,
                          elementPronounce: element.pronounce,
                          elementName: element.name,
                          silhouetteIcon: element.silhoutteAddress,
                          iconAddress: element.imageAddress,
                          totalPoint: 100,
                          isUnlocked: element.unlocked);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
