import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class HomeInfoContainer extends StatelessWidget {
  final String status;
  const HomeInfoContainer({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Widget textWidget;
    Color containerColor = const Color(0xBCFAF0FC);
    Color iconColor = purplePrimary;

    switch (status) {
      case 'reservation_incomplete':
        textWidget = RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    'Few more steps to complete your last reservation with Culture kindergarten. Continue with your ',
                style: textXS.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'last reservation ',
                style: textXS.copyWith(
                  color: orangePrimary,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: 'or ',
                style: textXS.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'reserve another kindergarten',
                style: textXS.copyWith(
                  color: orangePrimary,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        );
      case 'pending_physical_registration':
        textWidget = Text(
          'All the data and record will be updated only when you’ve complete the physical registration in kindergarten. Stay tuned!',
          style: textXS.copyWith(
            fontWeight: FontWeight.w500,
          ),
        );
      case 'fail':
        iconColor = redPrimary;
        containerColor = const Color(0xBAFFD4D4);
        textWidget = RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    'Your last registration in kindergarten was unsuccessful. Let’s ',
                style: textXS.copyWith(
                  color: redPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: 'find another kindergarten, ',
                style: textXS.copyWith(
                  color: orangePrimary,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
              ),
              TextSpan(
                text: 'shall we?',
                style: textXS.copyWith(
                  color: redPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
        break;
      default:
        textWidget = Text(
          'No Information',
          style: textXS.copyWith(
            fontWeight: FontWeight.w500,
          ),
        );
    }

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: height10, horizontal: width10 * 1.4),
      decoration: ShapeDecoration(
        color: containerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.info_outline,
            color: iconColor,
            size: height24,
          ),
          SizedBox(
            width: width24 / 2,
          ),
          Expanded(
            child: textWidget,
          ),
        ],
      ),
    );
  }
}
