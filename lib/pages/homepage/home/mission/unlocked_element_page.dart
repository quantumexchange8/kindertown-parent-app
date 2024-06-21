import 'package:flutter/material.dart';
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

    return Scaffold(
      appBar: AppBar(
        leading: const PrimaryBackButton(),
        actions: const [TotalStarContainer(totalStar: 131)],
      ),
      backgroundColor: backgroundColor,
      body: SecondaryPageBackground(
        child: Column(
          children: [
            YourArchievementColumn(unlockedElements: unlockedElements),
            SizedBox(height: height20 * 2),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(
                    vertical: height20, horizontal: width30),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: width24 / 2,
                    mainAxisExtent: height100 * 1.74,
                    mainAxisSpacing: height10 * 8,
                    crossAxisCount: 3),
                itemCount: allElements.length,
                itemBuilder: (context, index) {
                  final element = allElements[index];

                  return ElementColumn(
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
