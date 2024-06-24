import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class SubtitleContainer extends StatelessWidget {
  final String iconAddress;
  final String subtitle;
  const SubtitleContainer(
      {super.key, required this.iconAddress, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width100 * 3.56,
      height: height10 * 4.6,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: width100 * 3.46,
              height: height10 * 3.6,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                        'assets/images/subtitle_background_container.png')),
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: height08),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    iconAddress,
                    height: height20 * 2,
                    fit: BoxFit.fitHeight,
                  ),
                  SizedBox(
                    width: width10 * 1.4,
                  ),
                  Text(
                    subtitle,
                    style: textLg.copyWith(
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
