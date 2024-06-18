import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class AboutPage extends StatelessWidget {
  final String title;
  final String aboutText;
  const AboutPage({super.key, required this.aboutText, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: primaryAppbar(
          title: Text(
        title,
        style: textLg.copyWith(fontWeight: FontWeight.w700),
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height30, horizontal: width24),
        child: Column(
          children: [
            PrimaryContainer(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(
                  width20 + width08, height20, width24, height10 * 4.6),
              child: Text(
                aboutText,
                style: textSm.copyWith(fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
