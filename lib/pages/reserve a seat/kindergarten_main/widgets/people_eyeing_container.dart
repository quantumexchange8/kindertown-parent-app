import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PeopleEyeingContainer extends StatelessWidget {
  final int totalPeopleEyeing;
  const PeopleEyeingContainer({super.key, required this.totalPeopleEyeing});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width100 * 3.79,
      decoration: ShapeDecoration(
        gradient: const LinearGradient(
          begin: Alignment(1.00, 0.00),
          end: Alignment(-1, 0),
          colors: [Color(0xFFF5C5FD), Color(0xFFFFE9C5), Color(0xFFDE9FEA)],
        ),
        shadows: const [
          BoxShadow(
            color: Color(0xFFDE9FEA),
            blurRadius: 20,
            spreadRadius: 10,
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: DottedBorder(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: height24 / 4),
        strokeWidth: 2,
        child: Row(
          children: [
            Image.asset(
              'assets/icons/kindergarten/purple_group.png',
              height: height20,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(
              width: width24 / 2,
            ),
            Text(
              '$totalPeopleEyeing people are eyeing this kindergarten now',
              style: textXS.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
