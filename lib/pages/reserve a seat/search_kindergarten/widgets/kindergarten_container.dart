import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/kindergarten.dart';

class KindergartenContainer extends StatelessWidget {
  final Kindergarten kindergarten;
  const KindergartenContainer({super.key, required this.kindergarten});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      padding:
          EdgeInsets.symmetric(vertical: height10 * 1.4, horizontal: width20),
      child: Row(
        children: [
          Image.asset(
            kindergarten.logo,
            height: height100 * 1.13,
            width: width100 * 1.2,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: width08 * 2,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kindergarten.name,
                style: textLg.copyWith(fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: height10,
              ),
              _locationRow(kindergarten.location),
              SizedBox(
                height: height10,
              ),
              _totalStudentRow(kindergarten.totalStudent),
              SizedBox(
                height: height10,
              ),
              _ratedStarRow(
                  rating: kindergarten.rating,
                  totalPeople: kindergarten.totalPeopleRating)
            ],
          )
        ],
      ),
    );
  }
}

Row _locationRow(String location) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Image.asset(
        'assets/icons/location_icon.png',
        height: 24,
        fit: BoxFit.fitHeight,
      ),
      SizedBox(width: width08),
      Text(
        location,
        style: textXS.copyWith(
          fontSize: height10 * 1.3,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

Row _totalStudentRow(int totalStudent) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/icons/user-02.png',
        height: height24,
        fit: BoxFit.fitHeight,
      ),
      SizedBox(width: width08),
      Text(
        '$totalStudent/100',
        style: textMd.copyWith(
          color: redPrimary,
          fontSize: height15,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

Icon _starIcon(bool rated) => Icon(
      rated ? Icons.star_rounded : Icons.star_outline_rounded,
      color: yellowPrimary,
      size: height20,
    );

Row _ratedStarRow({required double rating, required int totalPeople}) {
  int rate = rating.toInt();
  List<Widget> children = [];

  for (var i = 1; i <= 5; i++) {
    children.add(Padding(
      padding: EdgeInsets.only(right: width08 / 2),
      child: _starIcon(i <= rate),
    ));
  }

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      ...children,
      SizedBox(
        width: width10,
      ),
      Text(
        '$rating ($totalPeople)',
        style: textMd.copyWith(fontSize: height15, fontWeight: FontWeight.w700),
      )
    ],
  );
}
