import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kindertown_parent_app/component/back_button.dart';
import 'package:kindertown_parent_app/component/secondary_page_background.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/models/element.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/element_column.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/total_star_container.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/your_archievement_column.dart';

class UnlockedElementPage extends StatelessWidget {
  final List<AchievementElement> allElements;
  const UnlockedElementPage({super.key, required this.allElements});

  @override
  Widget build(BuildContext context) {
    final unlockedElements =
        allElements.where((element) => element.unlocked).toList();

    const totalStar = 131;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: width10 * 2.5),
          child: const PrimaryBackButton(),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: width10 * 2.8),
            child: const TotalStarContainer(totalStar: totalStar),
          )
        ],
      ),
      backgroundColor: backgroundColor,
      body: SecondaryPageBackground(
        child: Column(
          children: [
            SizedBox(height: height20),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width10 * 2.8,
              ),
              child: YourArchievementColumn(unlockedElements: unlockedElements),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                    vertical: height20 * 2, horizontal: width30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: width24 / 2,
                    mainAxisExtent: height100 * 1.74,
                    mainAxisSpacing: height10 * 8,
                    crossAxisCount: 3),
                itemCount: allElements.length,
                itemBuilder: (context, index) {
                  final element = allElements[index];

                  return ElementColumn(
                      elementDescription: element.description,
                      elementPronounce: element.pronounce,
                      silhouetteIcon: element.silhoutteAddress,
                      iconAddress: element.imageAddress,
                      totalPoint: 100,
                      isUnlocked: element.unlocked,
                      elementName: element.name);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
