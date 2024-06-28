import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/bill.dart';

class PaymentDetailPage extends StatelessWidget {
  final Bill bill;
  const PaymentDetailPage({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    Map<String, String> additionalFee = {};
    for (var addtFee in bill.additionalFee) {
      additionalFee.addAll({addtFee.name: 'RM${addtFee.fee.round()}'});
    }

    void onPressedNext() {}

    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'View details',
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      )),
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width24),
        child: Column(
          children: [
            SizedBox(height: height31),
            PrimaryContainer(
              padding:
                  EdgeInsets.symmetric(vertical: height31, horizontal: width20),
              color: Colors.white,
              child: Column(
                children: [
                  Text(
                    'Invoice summary',
                    textAlign: TextAlign.center,
                    style: textXL.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  _invoiceInfoContainer(
                      invoiceNo: bill.no,
                      invoiceDate: bill.createdAt,
                      dueDate: bill.dueDate),
                  _feeColumn(
                      title: 'Monthly school fee',
                      data: {'Bill': 'RM${bill.monthlyFee.round()}'}),
                  _feeColumn(title: 'Additional Fee', data: additionalFee),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount due:',
                        style: textLg.copyWith(
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(height10),
                        decoration: ShapeDecoration(
                          color: const Color(0x0FAF00D2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'RM${bill.amountDue.toStringAsFixed(2)}',
                          textAlign: TextAlign.right,
                          style: textXL.copyWith(
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height20 * 4),
            Align(
                alignment: Alignment.centerRight,
                child: PrimaryTextButton(
                    onPressed: onPressedNext, buttonText: 'Next'))
          ],
        ),
      ),
    );
  }
}

Container _invoiceInfoContainer({
  required String invoiceNo,
  required DateTime invoiceDate,
  required DateTime dueDate,
}) {
  Widget textRow(String key, String value) => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: key,
              style: textSm.copyWith(
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            TextSpan(
              text: value,
              style: textSm.copyWith(
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ],
        ),
      );

  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(horizontal: width20, vertical: height08),
    decoration: ShapeDecoration(
      color: const Color(0x0FAF00D2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Column(
      children: [
        textRow('Invoice date: ', DateFormat('dd/MM/yyyy').format(invoiceDate)),
        textRow('Invoice no.: ', invoiceNo),
        textRow('Due date: ', DateFormat('dd/MM/yyyy').format(dueDate)),
      ],
    ),
  );
}

Column _feeColumn({
  required String title,
  required Map<String, String> data,
}) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(left: width24 / 2),
        child: Text(
          title,
          style: textLg.copyWith(
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
      ),
      SizedBox(height: height24 / 2),
      Container(
        padding:
            EdgeInsets.symmetric(horizontal: width20, vertical: height24 / 2),
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: data.entries
              .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        e.key,
                        style: textMd.copyWith(
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      Text(
                        e.value,
                        textAlign: TextAlign.right,
                        style: textMd.copyWith(
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ],
                  ))
              .toList(),
        ),
      )
    ],
  );
}
