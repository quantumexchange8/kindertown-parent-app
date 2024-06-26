import 'package:collection/collection.dart';
import 'package:decorated_text/decorated_text.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/content_column.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/academic/grade_overview.dart';

class GradesOverviewColumn extends StatelessWidget {
  final GradeOverview gradeOverview;
  const GradesOverviewColumn({super.key, required this.gradeOverview});

  @override
  Widget build(BuildContext context) {
    return ContentColumn(
        iconAddress: 'assets/images/academic/skill_development.png',
        subtitle: 'Grades overview',
        content: PrimaryContainer(
          color: Colors.white,
          padding:
              EdgeInsets.symmetric(horizontal: width24, vertical: height20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Open PDF',
                  style: textSm.copyWith(
                    color: yellowPrimary,
                    decorationColor: yellowPrimary,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                'Rank:',
                textAlign: TextAlign.center,
                style: textLg.copyWith(fontWeight: FontWeight.w700),
              ),
              _rankContainer(
                  rank: gradeOverview.rank, totalRank: gradeOverview.totalRank),
              SizedBox(height: height24),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Subjects',
                      style: textLg.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Marks',
                      style: textLg.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Grades',
                      style: textLg.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height10),
              ...gradeOverview.gradeList.mapIndexed((i, e) => Padding(
                    padding: EdgeInsets.only(
                        bottom: isLast(i, gradeOverview.gradeList.length)
                            ? 0
                            : height08),
                    child: _gradeContainer(e),
                  )),
              SizedBox(height: height20)
            ],
          ),
        ));
  }
}

Widget _rankContainer({
  required int rank,
  required int totalRank,
}) {
  bool isNumberOne = rank == 1;

  return Container(
    width: width100 * 3.29,
    height: height100 * 1.5,
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(29),
      ),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            'assets/images/academic/confetti.png',
            height: height100 * 1.2,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: height24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width20),
                child: SizedBox(
                  height: height100 * 1.28,
                  child: DecoratedGoogleFontText(
                    rank.toString(),
                    fontMethod: (
                        {background,
                        backgroundColor,
                        color,
                        decoration,
                        decorationColor,
                        decorationStyle,
                        decorationThickness,
                        fontFeatures,
                        fontSize,
                        fontStyle,
                        fontWeight,
                        foreground,
                        height,
                        letterSpacing,
                        locale,
                        shadows,
                        textBaseline,
                        textStyle,
                        wordSpacing}) {
                      return textXXL.copyWith(
                          fontSize: height100 * 1.28,
                          fontWeight: FontWeight.w700,
                          height: 0);
                    },
                    fillColor: isNumberOne ? null : purplePrimary,
                    fillGradient: isNumberOne
                        ? const RadialGradient(
                            colors: [Color(0xFFEC9C03), Color(0xFFFFDA92)])
                        : null,
                    shadows: const [Shadow(color: Color(0xFFffdc9a))],
                  ),
                ),
              ),
              Text(
                '/$totalRank',
                style: textLg.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        if (isNumberOne)
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(right: width30),
              child: Image.asset(
                'assets/images/academic/crown.png',
                height: height45,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
      ],
    ),
  );
}

Widget _gradeContainer(Grade grade) {
  return Container(
    padding: EdgeInsets.all(height10),
    decoration: ShapeDecoration(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                grade.subject,
                style: textMd.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Text(
                grade.mark.round().toString(),
                textAlign: TextAlign.right,
                style: textMd.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: Text(
                grade.grade,
                textAlign: TextAlign.right,
                style: textMd.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        if (grade.gradeComment != null)
          Padding(
            padding: EdgeInsets.only(top: height10),
            child: _commentContainer(grade.gradeComment!),
          ),
      ],
    ),
  );
}

Widget _commentContainer(GradeComment gradeComment) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: width24 / 2, vertical: height08),
    decoration: ShapeDecoration(
      color: const Color(0x26FCBF4A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comment from ${gradeComment.from}:',
          style: textSm.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.70,
          ),
        ),
        Text(
          gradeComment.comment,
          style: textSm.copyWith(
            letterSpacing: 0.70,
          ),
        ),
      ],
    ),
  );
}
