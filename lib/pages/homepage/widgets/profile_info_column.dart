import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class ProfileInfoColumn extends StatelessWidget {
  final String name;
  final String gender;
  final String kindergartenName;
  const ProfileInfoColumn(
      {super.key,
      required this.name,
      required this.kindergartenName,
      required this.gender});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/icons/kid_status/${gender == 'female' ? 'girl' : 'boy'}_profile.png',
          height: height100 * 1.86,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(
          height: height24 / 2,
        ),
        Text(
          name,
          textAlign: TextAlign.center,
          style: textXL.copyWith(
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        Text(
          'Student from $kindergartenName',
          style: textXS.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.60,
          ),
        )
      ],
    );
  }
}
