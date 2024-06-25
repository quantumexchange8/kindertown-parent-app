import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/content_column.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/articles_row.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/class_info_column.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/happening_now_slider.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/meal_of_the_day_container.dart';
import 'package:kindertown_parent_app/pages/homepage/home/widgets/missions_overview_scrollview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: height30),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width20),
          child: ClassInfoColumn(kidStatus: homeController.kidStatus.value!),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: height24),
          child: ContentColumn(
              iconAddress: 'assets/icons/home/mission.png',
              subtitle: 'Missions overview',
              content: MissionsOverviewScrollview(
                  missionList: missionController.missionList)),
        ),
        ContentColumn(
            iconAddress: 'assets/icons/home/megaphone.png',
            subtitle: 'Happening now',
            content: HappeningNowSlider(
                happeningNowList: homeController.happeningNowList)),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: height24, horizontal: width24),
          child: ContentColumn(
              iconAddress: 'assets/icons/home/meals.png',
              subtitle: 'Meal of the day',
              content: ListMealOfTheDayContainer(
                  mealOfTheDayList: homeController.mealOfTheDayList)),
        ),
        ContentColumn(
            iconAddress: 'assets/icons/home/newspaper.png',
            subtitle: 'Articles',
            content: ArticlesRow(articleList: homeController.articleList)),
        SizedBox(height: height100 * 1.3)
      ],
    );
  }
}
