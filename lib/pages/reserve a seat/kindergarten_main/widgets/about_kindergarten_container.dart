import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/about_page.dart';

class AboutKindergartenContainer extends StatelessWidget {
  final String aboutText;
  const AboutKindergartenContainer({super.key, required this.aboutText});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      padding: EdgeInsets.fromLTRB(width10 * 2.8, height24, width10 * 2.8, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            aboutText,
            maxLines: 7,
            overflow: TextOverflow.ellipsis,
            style: textSm.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: height08),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutPage(aboutText: aboutText),
                  ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Read more',
                  style: textSm.copyWith(
                    color: yellowPrimary,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: yellowPrimary,
                  size: height20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
