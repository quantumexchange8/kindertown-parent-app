import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/kindergarten.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/review_page.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/widgets/rating_column.dart';

class RatingContainer extends StatelessWidget {
  final Kindergarten kindergarten;
  const RatingContainer({super.key, required this.kindergarten});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      padding: EdgeInsets.all(width20),
      child: Column(
        children: [
          RatingColumn(
              rating: kindergarten.rating,
              totalPeopleRating: kindergarten.totalPeopleRating,
              ratingPerPeopleRate: kindergarten.ratingPerPeopleRate),
          SizedBox(
            height: height10 * 1.7,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: _seeMoreRow(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewPage(
                        kindergarten: kindergarten,
                      ),
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}

InkWell _seeMoreRow({void Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'See more',
          style: textSm.copyWith(
              color: yellowPrimary,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationColor: yellowPrimary),
        ),
        Icon(
          Icons.arrow_forward_ios,
          size: height08 * 2,
          color: yellowPrimary,
        ),
      ],
    ),
  );
}
