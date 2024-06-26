import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/meal_of_the_day.dart';

const List<String> mealsType = ['Breakfast', 'Lunch', 'Dinner', 'Snacks'];

class ListMealOfTheDayContainer extends StatelessWidget {
  final List<MealOfTheDay> mealOfTheDayList;
  const ListMealOfTheDayContainer({super.key, required this.mealOfTheDayList});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      color: Colors.white,
      padding: EdgeInsets.all(height10 * 1.1),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: mealOfTheDayList.isNotEmpty
            ? mealOfTheDayList
                .mapIndexed((i, e) => Padding(
                      padding: EdgeInsets.only(
                          bottom: isLast(i, mealOfTheDayList.length)
                              ? 0
                              : height10),
                      child: _mealOfTheDayContainer(index: i, mealOfTheDay: e),
                    ))
                .toList()
            : mealsType
                .mapIndexed((i, e) => Padding(
                      padding: EdgeInsets.only(
                          bottom: isLast(i, mealsType.length) ? 0 : height10),
                      child: _noDataContainer(mealType: e, isEven: i.isEven),
                    ))
                .toList(),
      ),
    );
  }
}

Widget _mealOfTheDayContainer({
  required int index,
  required MealOfTheDay mealOfTheDay,
}) {
  return Container(
    padding:
        EdgeInsets.symmetric(vertical: height08 * 2, horizontal: width10 * 2.2),
    decoration: ShapeDecoration(
      color: index.isEven ? const Color(0x0FAF00D2) : backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Row(
      children: [
        Container(
          width: height100 * 1.2,
          height: height100 * 1.2,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage(mealOfTheDay.image),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
        ),
        SizedBox(
          width: width10 * 2.8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mealOfTheDay.type.capitalizeFirst ?? mealOfTheDay.type,
                style: textLg.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                mealOfTheDay.description,
                style: textSm.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _noDataContainer({
  required String mealType,
  required bool isEven,
}) {
  return Container(
    padding:
        EdgeInsets.symmetric(vertical: height08 * 2, horizontal: width10 * 2.2),
    decoration: ShapeDecoration(
      color: isEven ? const Color(0x0FAF00D2) : yellowPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Row(
      children: [
        Container(
          width: height100 * 1.2,
          height: height100 * 1.2,
          decoration: ShapeDecoration(
            color: const Color(0xFFE0E0E0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.photo,
                size: height31,
                color: const Color(0xFF898A8D),
              ),
              Text(
                'No image',
                textAlign: TextAlign.center,
                style: textSm.copyWith(
                  color: const Color(0xFF898A8D),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mealType,
              style: textLg.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'No data yet.',
              style: textSm.copyWith(
                color: const Color(0xFF898A8D),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
