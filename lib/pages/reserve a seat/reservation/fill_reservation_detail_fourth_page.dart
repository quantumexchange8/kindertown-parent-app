import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/reservation_detail_page_layout.dart';

class FillReservationDetailFourthPage extends StatelessWidget {
  const FillReservationDetailFourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final invoice = {
      'Deposit': {'Deposit name': 'RM150'},
      'Remaining due': {
        'Item 1': 'RM500',
        'Item 2': 'RM500',
        'Item 3': 'RM500'
      },
      'Upfront payment': {'Deposit': 'RM150'}
    };

    return ReservationDetailPageLayout(
        activeStep: 3,
        title: 'Invoice & Payment',
        contents: invoice.entries
            .mapIndexed((i, e) => Padding(
                  padding: EdgeInsets.only(
                      bottom: isLast(i, invoice.entries.length) ? 0 : height30),
                  child: _invoiceDataColumn(key: e.key, data: e.value),
                ))
            .toList(),
        isNextDisabled: false);
  }
}

Column _invoiceDataColumn({
  bool haveInfoContainer = false,
  required String key,
  required Map<String, dynamic> data,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        key,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      if (haveInfoContainer) _infoContainer,
      SizedBox(
        height: height24 / 2,
      ),
      ...data.entries.mapIndexed((i, e) => Padding(
          padding: EdgeInsets.only(
              bottom: isLast(i, data.entries.length) ? 0 : height24 / 2),
          child: _dataContainer(key: e.key, value: e.value)))
    ],
  );
}

Container _infoContainer = Container(
  padding: EdgeInsets.symmetric(horizontal: width08 * 2, vertical: height08),
  decoration: ShapeDecoration(
    color: const Color(0x0FAF00D2),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Icon(
        Icons.info_outline_rounded,
        color: purplePrimary,
        size: height24,
      ),
      SizedBox(
        width: width24 / 2,
      ),
      Expanded(
        child: Text(
          'Please note that the amount of remaining due might subject to change if you’ve add-on any services upon registration.',
          style: textXS.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ],
  ),
);

Container _dataContainer({
  required String key,
  required String value,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: width20, vertical: height24 / 2),
    width: double.infinity,
    decoration: ShapeDecoration(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key,
          style: textMd.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          value,
          textAlign: TextAlign.right,
          style: textMd.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
