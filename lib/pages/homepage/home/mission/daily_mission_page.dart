import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/secondary_page_background.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/mission.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/unlocked_element_page.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/mission_progress_bar.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/missions_of_the_day_column.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/widgets/total_star_container.dart';

class DailyMissionPage extends StatelessWidget {
  final List<Mission> missionList;
  const DailyMissionPage({super.key, required this.missionList});

  @override
  Widget build(BuildContext context) {
    final totalCompletedMission =
        missionList.where((element) => element.isCompleted).length;

    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Daily Mission',
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
        ),
      )),
      body: SecondaryPageBackground(
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () async {
                      missionController
                          .getAchievementElements()
                          .then((allElements) {
                        if (allElements != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UnlockedElementPage(
                                    allElements: allElements),
                              ));
                        }
                      });
                    },
                    child: const TotalStarContainer(totalStar: 131))),
            MissionProgressBar(
                value: totalCompletedMission / missionList.length),
            MissionsOfTheDayColumn(missionList: missionList)
          ],
        ),
      ),
    );
  }
}
