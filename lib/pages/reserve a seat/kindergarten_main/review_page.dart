import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/kindergarten.dart';
import 'package:kindertown_parent_app/models/review.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/rating_column.dart';

class ReviewPage extends StatelessWidget {
  final Kindergarten kindergarten;
  const ReviewPage({super.key, required this.kindergarten});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Review',
        style: textLg.copyWith(fontWeight: FontWeight.w700),
      )),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: height31, horizontal: width20),
        children: [
          RatingColumn(
              rating: kindergarten.rating,
              totalPeopleRating: kindergarten.totalPeopleRating,
              ratingPerPeopleRate: kindergarten.ratingPerPeopleRate),
          SizedBox(height: height31),
          ...kindergarten.reviewList.mapIndexed((i, e) => Padding(
                padding: EdgeInsets.only(
                    bottom: isLast(i, kindergarten.reviewList.length)
                        ? 0
                        : height20),
                child: _reviewContainer(review: e),
              )),
          SizedBox(height: height10 * 4.7),
          Text(
            'End of comment section.',
            style: textMd.copyWith(
                fontSize: height10 * 1.7, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

Widget _reviewContainer({
  required Review review,
}) {
  return PrimaryContainer(
    padding: EdgeInsets.symmetric(vertical: height24, horizontal: width30),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              width: height30 * 2,
              height: height30 * 2,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage(review.profilePicture),
                  fit: BoxFit.cover,
                ),
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: yellowPrimary),
                ),
                shadows: [
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
              width: width08 * 2,
            ),
            Column(
              children: [
                Text(
                  '@alicia0810',
                  style: TextStyle(
                    color: Color(0xFF3C0048),
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: FlutterLogo(),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: FlutterLogo(),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: FlutterLogo(),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: FlutterLogo(),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      width: 20,
                      height: 20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(),
                      child: FlutterLogo(),
                    ),
                    Text(
                      '4.8',
                      style: TextStyle(
                        color: Color(0xFF3C0048),
                        fontSize: 15,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: height20,
        ),
        Text(
          "‘${review.title}’",
          style: textLg.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: height10),
        Text(
          review.body,
          style: textSm.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
