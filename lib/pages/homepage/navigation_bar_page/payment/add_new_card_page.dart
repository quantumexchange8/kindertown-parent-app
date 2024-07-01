import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/component/textlabel_with_textfield_column.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/payment/widgets/expiry_date_column.dart';

class AddNewCardPage extends StatefulWidget {
  const AddNewCardPage({super.key});

  @override
  State<AddNewCardPage> createState() => _AddNewCardPageState();
}

class _AddNewCardPageState extends State<AddNewCardPage> {
  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();

  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onPressedSubmit() {}

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: primaryAppbar(
          title: Text(
        'Add card',
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
          height: 0,
        ),
      )),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Card Details',
              style: textXXL.copyWith(
                fontSize: height10 * 2.8,
                fontWeight: FontWeight.w700,
                height: 0.05,
              ),
            ),
          ),
          SizedBox(height: height08),
          PrimaryContainer(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                vertical: height08 * 2, horizontal: width20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _informationBar,
                TextlabelWithTextfieldColumn(
                    controller: cardNameController,
                    textLabel: 'Name on card:',
                    focusNode: FocusNode()),
                TextlabelWithTextfieldColumn(
                    controller: cardNumberController,
                    textLabel: 'Card number:',
                    focusNode: FocusNode()),
                Row(
                  children: [
                    ExpiryDateColumn(
                        monthController: monthController,
                        yearController: yearController),
                    SizedBox(width: width10 * 3.7),
                    Expanded(
                      child: TextlabelWithTextfieldColumn(
                          controller: cvvController,
                          textLabel: 'CVV:',
                          focusNode: FocusNode()),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: height10 * 4.8),
          PrimaryTextButton(
              onPressed: onPressedSubmit,
              width: width100 * 1.72,
              buttonText: 'Submit')
        ],
      ),
    );
  }
}

Container _informationBar = Container(
  padding: EdgeInsets.symmetric(horizontal: width15, vertical: height08),
  decoration: ShapeDecoration(
    color: const Color(0xFFE9F7E1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  child: Row(
    children: [
      Image.asset(
        'assets/icons/payment/protection_icon.png',
        height: height10 * 2.6,
        fit: BoxFit.fitHeight,
      ),
      SizedBox(height: height15),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Your card details will be protected',
              style: textSm.copyWith(
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            Text(
              'We prioritise the safety and security of your card details. KinderTown does not have any access to your card information.',
              style: textXS.copyWith(
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);
