import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/element.dart';
import 'package:kindertown_parent_app/pages/homepage/home/mission/your_archivement_page.dart';

class YourArchievementColumn extends StatelessWidget {
  final List<AchievementElement> unlockedElements;
  const YourArchievementColumn({super.key, required this.unlockedElements});

  @override
  Widget build(BuildContext context) {
    List<AchievementElement> showElements = [];

    if (unlockedElements.isNotEmpty) {
      if (unlockedElements.length >= 4) {
        showElements = unlockedElements.sublist(0, 4);
      } else {
        showElements = unlockedElements.sublist(0, unlockedElements.length);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your achievement:',
          textAlign: TextAlign.right,
          style: textXS.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: 0.60,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => YourArchivementPage(
                    achiveElements: unlockedElements,
                  ),
                ));
          },
          child: Container(
            padding:
                EdgeInsets.symmetric(vertical: height10, horizontal: width15),
            decoration: ShapeDecoration(
              color: const Color(0x0FAF00D2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...showElements.mapIndexed((i, e) => Padding(
                      padding: EdgeInsets.only(
                          right:
                              isLast(i, showElements.length) ? 0 : width24 / 2),
                      child: Image.asset(
                        e.imageAddress,
                        width: height20 * 2,
                        height: height20 * 2,
                      ),
                    )),
                Text(
                  'view more>',
                  textAlign: TextAlign.right,
                  style: textXS.copyWith(
                      color: orangePrimary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      letterSpacing: 0.60,
                      decorationColor: orangePrimary),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
