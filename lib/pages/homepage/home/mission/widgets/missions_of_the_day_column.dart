import 'package:dotted_border/dotted_border.dart';
import 'package:entry/entry.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/mission.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/content_column.dart';

class MissionsOfTheDayColumn extends StatelessWidget {
  final List<Mission> missionList;
  const MissionsOfTheDayColumn({super.key, required this.missionList});

  @override
  Widget build(BuildContext context) {
    return ContentColumn(
        iconAddress: 'assets/icons/home/mission.png',
        subtitle: 'Missions of the day',
        content: ListView.builder(
          shrinkWrap: true,
          itemCount: missionList.length,
          itemBuilder: (context, index) {
            final mission = missionList[index];

            return Padding(
              padding: EdgeInsets.only(
                  bottom: isLast(index, missionList.length) ? 0 : height20),
              child: _missionContainer(
                  mission: mission,
                  currentIndex: index,
                  totalMissionLength: missionList.length),
            );
          },
        ));
  }
}

Widget _missionContainer({
  required Mission mission,
  required int currentIndex,
  required int totalMissionLength,
}) {
  return PrimaryContainer(
    padding: EdgeInsets.symmetric(horizontal: width24, vertical: height08 * 2),
    color: Colors.white,
    child: Row(
      children: [
        Image.asset(
          mission.iconAddress,
          height: height10 * 2.8,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(
          width: width15,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mission.description,
                style: textMd.copyWith(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.80,
                ),
              ),
              Text(
                'Mission ${currentIndex + 1}/$totalMissionLength',
                style: textXS.copyWith(
                  color: orangePrimary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.60,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: width10 * 3.3,
          height: height10 * 3.1,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: width10 * 2.9,
                height: height10 * 2.5,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 2, color: orangePrimary),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: DottedBorder(
                  color: redPrimary,
                  borderPadding: const EdgeInsets.all(2),
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(5),
                  dashPattern: const [5, 5],
                  strokeWidth: 2,
                  child: Container(),
                ),
              ),
              Entry.scale(
                visible: mission.isCompleted,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    'assets/icons/missions/red_check.png',
                    height: height10 * 2.8,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
