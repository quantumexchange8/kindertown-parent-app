import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/payment/widgets/payment_container.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final billHistory = paymentController.billList;

      return ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height30),
        itemCount: billHistory.length,
        itemBuilder: (context, index) {
          final bill = billHistory[index];

          return Padding(
            padding: EdgeInsets.only(
                bottom: isLast(index, billHistory.length)
                    ? height100 * 1.2
                    : height30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMMM yyyy').format(bill.createdAt),
                  style: textXL.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
                SizedBox(height: height08),
                PaymentContainer(
                    totalBill: bill.amountDue,
                    dueDate: bill.dueDate,
                    paid: bill.paid),
              ],
            ),
          );
        },
      );
    });
  }
}
