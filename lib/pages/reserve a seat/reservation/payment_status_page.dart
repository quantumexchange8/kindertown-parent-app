import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class PaymentStatusPage extends StatelessWidget {
  final String status;
  const PaymentStatusPage({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    bool isSuccess = status == 'success';
    String description = isSuccess
        ? 'Please note that the kindergarten will contact you within 2-3 working days regarding the details for physical registration.'
        : 'Your payment was unsuccessful due to unforeseen circumstances. Please try again or use another payment method.';

    void onPressedButton() {}

    return Scaffold(
      appBar: primaryAppbar(
          showBackButton: false,
          title: Text(
            'Payment status',
            textAlign: TextAlign.center,
            style: textLg.copyWith(
              fontWeight: FontWeight.w700,
            ),
          )),
      body: PrimaryPageBackground(
        padding: EdgeInsets.symmetric(horizontal: width30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width10 * 6),
              child: Text(
                isSuccess ? 'Payment Successful!' : 'Payment Failed...',
                textAlign: TextAlign.center,
                style: textXXL.copyWith(
                  fontSize: height20 * 2,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height24),
              child: Image.asset(
                'assets/images/payment_${isSuccess ? 'success' : 'failed'}_illustration.png',
                height: height100 * 3.22,
                fit: BoxFit.fitHeight,
              ),
            ),
            Text(
              description,
              textAlign: TextAlign.center,
              style: textMd.copyWith(
                fontSize: height15,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: height30 * 2,
            ),
            PrimaryTextButton(
                onPressed: onPressedButton,
                buttonText: isSuccess ? 'Alright!' : 'Try again')
          ],
        ),
      ),
    );
  }
}
