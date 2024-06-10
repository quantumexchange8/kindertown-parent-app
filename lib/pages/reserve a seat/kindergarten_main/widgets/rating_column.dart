import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:progresso/progresso.dart';

class RatingColumn extends StatelessWidget {
  final double rating;
  final int totalPeopleRating;
  final Map<String, dynamic> ratingPerPeopleRate;
  const RatingColumn(
      {super.key,
      required this.rating,
      required this.totalPeopleRating,
      required this.ratingPerPeopleRate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _titleContainer(
            totalRating: rating, totalPeopleRate: totalPeopleRating),
        ...ratingPerPeopleRate.entries.mapIndexed((i, e) => Padding(
              padding: EdgeInsets.only(
                  bottom: isLast(i, ratingPerPeopleRate.entries.length)
                      ? 0
                      : height10),
              child: _starRow(
                  star: int.parse(e.key),
                  people: int.parse(e.value),
                  totalPeople: totalPeopleRating),
            )),
      ],
    );
  }
}

Container _titleContainer(
    {required double totalRating, required int totalPeopleRate}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: width24, vertical: height24 / 2),
    decoration: ShapeDecoration(
      color: const Color(0x0FAF00D2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.star_rounded,
              color: yellowPrimary,
              size: height10 * 4.4,
            ),
            SizedBox(width: width10 / 2),
            Text(
              totalRating.toString(),
              style: textXXL.copyWith(
                fontSize: height10 * 4.8,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Text(
          '$totalPeopleRate people rate it',
          textAlign: TextAlign.center,
          style: textSm.copyWith(
            fontSize: height10 * 1.3,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );
}

Row _starRow({
  required int star,
  required int people,
  required int totalPeople,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        star.toString(),
        textAlign: TextAlign.center,
        style: textSm.copyWith(
          fontSize: height10 * 1.3,
          fontWeight: FontWeight.w700,
        ),
      ),
      SizedBox(width: width10 * 0.7),
      Icon(
        Icons.star_rounded,
        color: yellowPrimary,
        size: height08 * 2,
      ),
      SizedBox(width: width10 * 0.7),
      Progresso(
        progress: people / totalPeople,
        backgroundColor: const Color(0xFFCFCFCF),
        backgroundStrokeWidth: height08 * 2,
        backgroundStrokeCap: StrokeCap.round,
        progressStrokeWidth: height08 * 2,
        progressColor: yellowPrimary,
        progressStrokeCap: StrokeCap.round,
      ),
      SizedBox(width: width10 * 0.7),
      Text(
        '($people)',
        textAlign: TextAlign.center,
        style: textSm.copyWith(
          fontSize: height10 * 1.3,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
