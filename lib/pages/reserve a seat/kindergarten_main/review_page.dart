import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: backgroundColor,
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
            textAlign: TextAlign.center,
            style: textMd.copyWith(
                fontSize: height10 * 1.7, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: height30,
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
    color: Colors.white,
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
                shape: const OvalBorder(
                  side: BorderSide(width: 1, color: yellowPrimary),
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
              width: width08 * 2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '@${review.username}',
                  style: textLg.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _starRow(review.rating),
                    SizedBox(
                      width: width08,
                    ),
                    Text(
                      review.rating.toString(),
                      style: textMd.copyWith(
                        fontSize: height15,
                        fontWeight: FontWeight.w700,
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

Row _starRow(double rating) {
  int rate = rating.round();

  List<Widget> children = [];
  for (var i = 1; i <= 5; i++) {
    children.add(
      Padding(
        padding: EdgeInsets.only(right: isLast(i, 6) ? 0 : width08 / 2),
        child: Icon(
          i <= rate ? Icons.star_rounded : Icons.star_outline_rounded,
          size: height20,
          color: yellowPrimary,
        ),
      ),
    );
  }

  return Row(
    children: children,
  );
}
