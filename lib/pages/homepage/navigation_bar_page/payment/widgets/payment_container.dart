import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PaymentContainer extends StatelessWidget {
  final double totalBill;
  final DateTime dueDate;
  final bool paid;
  const PaymentContainer(
      {super.key,
      required this.totalBill,
      required this.dueDate,
      required this.paid});

  @override
  Widget build(BuildContext context) {
    void onPressedPay() {}

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: paid ? 0 : width08 / 2),
          child: Container(
            decoration: ShapeDecoration(
              color: paid ? const Color(0xFFE9E9E9) : Colors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: orangePrimary),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: DottedBorder(
              color: paid ? const Color(0xFFAFAFAF) : redPrimary,
              strokeWidth: 3,
              borderType: BorderType.RRect,
              radius: const Radius.circular(20),
              borderPadding: const EdgeInsets.all(4),
              dashPattern: const [5, 5],
              padding: EdgeInsets.all(width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'RM',
                              style: textXS.copyWith(
                                color: paid
                                    ? const Color(0xFFAFAFAF)
                                    : orangePrimary,
                                fontWeight: FontWeight.w700,
                                height: 0.12,
                                letterSpacing: 0.60,
                              ),
                            ),
                            TextSpan(
                              text: totalBill.round().toString(),
                              style: textXXL.copyWith(
                                color: paid
                                    ? const Color(0xFFAFAFAF)
                                    : orangePrimary,
                                fontSize: height10 * 5,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2.50,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Monthly School Bill',
                        style: textMd.copyWith(
                          color: paid ? const Color(0xFFAFAFAF) : purplePrimary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.80,
                        ),
                      ),
                      Text(
                        'Due on: ${DateFormat('dd/MM/yyyy').format(dueDate)}',
                        style: textXS.copyWith(
                          color: paid
                              ? const Color(0xFFAFAFAF)
                              : const Color(0xFF898A8D),
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment:
                        paid ? MainAxisAlignment.start : MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'View receipt',
                            style: textSm.copyWith(
                              color: const Color(0xFFAFAFAF),
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                              height: 0.11,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color(0xFFAfAfAf),
                            size: height20,
                          ),
                        ],
                      ),
                      if (!paid)
                        PrimaryTextButton(
                          onPressed: onPressedPay,
                          buttonText: 'Pay',
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        if (!paid)
          Container(
            width: height10 * 2.2,
            height: height10 * 2.2,
            decoration: const BoxDecoration(
              color: redPrimary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
          )
      ],
    );
  }
}
