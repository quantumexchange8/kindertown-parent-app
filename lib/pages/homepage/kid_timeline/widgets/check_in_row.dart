import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/models/kid_status/check_in.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/content_tile.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/status_container.dart';

class CheckInRow extends StatelessWidget {
  final CheckInStatus checkInStatus;
  final bool isLast;
  const CheckInRow(
      {super.key, required this.checkInStatus, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final checkInTime = checkInStatus.time;
    final temp = checkInStatus.temperature;
    Color backgroundColor;
    Color borderColor;

    if (checkInTime.isAfter(
        DateTime(checkInTime.year, checkInTime.month, checkInTime.day, 8))) {
      backgroundColor = const Color(0xFFFFFF92);
      borderColor = orangePrimary;
    } else {
      if (temp >= 38.0) {
        borderColor = redPrimary;
        backgroundColor = const Color(0xFFFFF1F1);
      } else if (temp > 36.4 && temp < 38.0) {
        backgroundColor = const Color(0xFFFDFEFD);
        borderColor = const Color(0xFF4D9138);
      } else {
        backgroundColor = const Color(0xFFFFF3E7);
        borderColor = orangePrimary;
      }
    }

    return ContentTile(
      isLast: isLast,
      statusIconAddress: 'assets/icons/kid_status/check_in_icon.png',
      status: 'Checked in',
      startTime: checkInStatus.time,
      from: checkInStatus.from,
      statusComment: checkInStatus.statusComment,
      createdAt: checkInStatus.createdAt,
      statusContainer: StatusContainer(
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          text: '$temp°C'),
    );
  }
}
