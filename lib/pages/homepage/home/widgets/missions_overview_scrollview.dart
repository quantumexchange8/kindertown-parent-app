import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/mission.dart';

class MissionsOverviewScrollview extends StatelessWidget {
  final List<Mission> missionList;
  const MissionsOverviewScrollview({super.key, required this.missionList});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: width24 / 2),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: missionList
            .mapIndexed((i, e) => Padding(
                  padding: EdgeInsets.only(
                      right: isLast(i, missionList.length) ? 0 : width24 / 2),
                  child: _missionContainer(
                      icon: e.iconAddress,
                      missionCompleted: i + 1,
                      totalMission: missionList.length,
                      mission: e.description),
                ))
            .toList(),
      ),
    );
  }
}

PrimaryContainer _missionContainer({
  required String icon,
  required int missionCompleted,
  required int totalMission,
  required String mission,
}) {
  return PrimaryContainer(
    padding: EdgeInsets.all(height10 * 1.7),
    color: Colors.white,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          icon,
          height: height10 * 2.8,
        ),
        Text(
          mission,
          style: textMd.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'Mission $missionCompleted/$totalMission',
          style: textXS.copyWith(
            color: orangePrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}
