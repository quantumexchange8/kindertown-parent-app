import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/models/kid_status/meal_intake.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/content_tile.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/status_container.dart';

class MealInTakeRow extends StatelessWidget {
  final MealIntakeStatus mealIntakeStatus;
  final bool isLast;
  const MealInTakeRow(
      {super.key, required this.mealIntakeStatus, required this.isLast});

  @override
  Widget build(BuildContext context) {
    final String finishText;

    switch (mealIntakeStatus.mealIntake) {
      case 25:
        finishText = 'finish 25%';
      case 50:
        finishText = 'finish half';
      case 75:
        finishText = 'finish 75%';
      case 100:
        finishText = 'finish all';
        break;
      default:
        finishText = '0%';
    }

    return ContentTile(
      isLast: isLast,
      statusIconAddress: 'assets/icons/kid_status/cereals_icon.png',
      status: 'Meal intake',
      startTime: mealIntakeStatus.startTime,
      endTime: mealIntakeStatus.endTime,
      statusComment: mealIntakeStatus.comment,
      from: mealIntakeStatus.from,
      createdAt: mealIntakeStatus.createdAt,
      statusContainer: StatusContainer(
          backgroundColor: const Color(0xFFFCF0FF),
          borderColor: const Color(0xFF6E0882),
          text: finishText),
    );
  }
}
