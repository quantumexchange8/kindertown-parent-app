import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_textfield.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class ExpiryDateColumn extends StatelessWidget {
  final TextEditingController? monthController;
  final TextEditingController? yearController;
  const ExpiryDateColumn(
      {super.key, this.monthController, this.yearController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          ' Expiry date:',
          style: textLg.copyWith(
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        SizedBox(height: height08),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: width10 * 7.4,
              child: PrimaryTextfield(
                focusNode: FocusNode(),
                maxLength: 2,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.datetime,
                controller: monthController,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width10 / 2),
              child: Image.asset(
                'assets/icons/payment/line_over.png',
                height: height10 * 3.8,
                fit: BoxFit.fitHeight,
              ),
            ),
            SizedBox(
              width: width10 * 7.4,
              child: PrimaryTextfield(
                focusNode: FocusNode(),
                maxLength: 4,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.datetime,
                controller: yearController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
