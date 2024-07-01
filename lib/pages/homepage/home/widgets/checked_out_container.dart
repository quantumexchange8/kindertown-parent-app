import 'package:decorated_text/decorated_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class CheckedOutContainer extends StatelessWidget {
  final DateTime checkedOutTime;
  final String gender;
  const CheckedOutContainer(
      {super.key, required this.checkedOutTime, required this.gender});

  @override
  Widget build(BuildContext context) {
    String status = 'checked-out at';

    if (checkedOutTime.isBefore(DateTime(
        checkedOutTime.year, checkedOutTime.month, checkedOutTime.day, 16))) {
      status = 'early check-out';
    }

    return SizedBox(
      width: width100 * 3.89,
      height: height100 * 1.61,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: width100 * 3.89,
            height: height100 * 1.24,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21),
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
            child: Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFB98624)),
                  borderRadius: BorderRadius.circular(21),
                ),
              ),
              child: DottedBorder(
                color: yellowPrimary,
                borderPadding: const EdgeInsets.all(4),
                borderType: BorderType.RRect,
                radius: const Radius.circular(21),
                dashPattern: const [6, 6],
                strokeWidth: 3,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/images/kid_status/checked_out_background.png',
                        width: width100 * 1.96,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width20),
                        child: Image.asset(
                          'assets/images/kid_status/checked_out_bubble.png',
                          width: width100 * 1.81,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                DateFormat('dd/MM').format(checkedOutTime),
                                style: textMd.copyWith(
                                  color: yellowPrimary,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: width08),
                              Padding(
                                padding: EdgeInsets.only(right: width24),
                                child: Container(
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFFFF2E4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x3F000000),
                                        blurRadius: 2.10,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                  ),
                                  child: Text(
                                    status,
                                    style: textSm.copyWith(
                                      color: yellowPrimary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DecoratedGoogleFontText(
                                formatAMPM(DateFormat('hh:mm ')
                                    .format(checkedOutTime)),
                                borderColor: yellowPrimary,
                                borderWidth: 3,
                                fillColor: Colors.white,
                                fontSize: height10 * 4.8,
                                shadows: const [
                                  Shadow(
                                      color: yellowPrimary,
                                      blurRadius: 10,
                                      offset: Offset(0, 0))
                                ],
                                fontWeight: FontWeight.w700,
                                fontMethod: GoogleFonts.raleway,
                              ),
                              DecoratedGoogleFontText(
                                formatAMPM(
                                    DateFormat('a').format(checkedOutTime)),
                                borderColor: yellowPrimary,
                                borderWidth: 3,
                                fillColor: Colors.white,
                                fontSize: height10 * 2.4,
                                // shadows: const [
                                //   Shadow(
                                //     color: Color(0xFFFFF2E4),
                                //     blurRadius: 10,
                                //   )
                                // ],
                                fontWeight: FontWeight.w700,
                                fontMethod: GoogleFonts.raleway,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              gender.toLowerCase() == 'boy'
                  ? 'assets/images/kid_status/boy_checked_out.png'
                  : 'assets/images/kid_status/girl_checked_out.png',
              height: height100 * 1.6,
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
    );
  }
}
