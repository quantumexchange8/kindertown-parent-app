import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class SubscribeBottomBar extends StatelessWidget {
  final double fee;
  final void Function()? onPressedSubscribe;
  final bool isDisabled;
  final String buttonText;
  const SubscribeBottomBar(
      {super.key,
      required this.fee,
      this.isDisabled = false,
      this.onPressedSubscribe,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: height100 * 1.74,
      child: Stack(
        children: [
          Column(
            children: [
              _feeContainer,
            ],
          ),
          Align(alignment: Alignment.bottomCenter, child: _bottomContainer),
          Align(
            alignment: Alignment.center,
            child: Row(
              children: [
                SizedBox(
                  width: width10 * 2.2,
                ),
                _feeColumn(fee),
                SizedBox(width: width30),
                Expanded(
                  child: _subscribeContainer(
                      onPressed: onPressedSubscribe,
                      isDisabled: isDisabled,
                      buttonText: buttonText),
                ),
                SizedBox(
                  width: width10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _subscribeContainer(
    {required void Function()? onPressed,
    required bool isDisabled,
    required String buttonText}) {
  return PrimaryTextButton(
    height: height10 * 5.8,
    onPressed: isDisabled ? null : onPressed,
    isDisabled: isDisabled,
    backgroundColor: isDisabled ? const Color(0xFFE0E0E0) : orangePrimary,
    dotColor: isDisabled ? const Color(0xFFCFCFCF) : redPrimary,
    buttonText: buttonText,
  );
}

Container _feeContainer = Container(
  width: height100 * 1.8,
  height: height100 * 1.8,
  padding: const EdgeInsets.all(1),
  decoration: const BoxDecoration(
    color: yellowPrimary,
    shape: BoxShape.circle,
  ),
  child: Container(
    padding: const EdgeInsets.all(2),
    decoration: BoxDecoration(
        border: Border.all(width: 1, color: redPrimary),
        shape: BoxShape.circle),
    child: DottedBorder(
      borderType: BorderType.Circle,
      color: Colors.white,
      strokeWidth: 3,
      dashPattern: const [4, 4],
      child: Container(),
    ),
  ),
);

Column _feeColumn(double fee) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'RM\n',
              style: textMd.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: fee.toInt().toString(),
              style: textXXL.copyWith(
                color: Color(0xFF3C0048),
                fontSize: height10 * 6.4,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: '+',
              style: textXXL.copyWith(
                fontSize: height10 * 3.6,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: height24 / 2),
      Text(
        '/month',
        style: textMd.copyWith(fontWeight: FontWeight.w500),
      )
    ],
  );
}

Container _bottomContainer = Container(
  width: screenWidth,
  height: height20 * 4,
  decoration: const ShapeDecoration(
    color: yellowPrimary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
    ),
  ),
);
