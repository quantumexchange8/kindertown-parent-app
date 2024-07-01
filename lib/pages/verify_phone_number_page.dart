import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/back_button.dart';
import 'package:kindertown_parent_app/component/message_dialog.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/auth/login/underlined_textbutton.dart';
import 'package:kindertown_parent_app/pages/auth/referral_code_page.dart';
import 'package:kindertown_parent_app/pages/auth/widgets/title_column.dart';
import 'package:pinput/pinput.dart';

class VerifyPhoneNumberPage extends StatefulWidget {
  final String phoneNumber;
  const VerifyPhoneNumberPage({super.key, required this.phoneNumber});

  @override
  State<VerifyPhoneNumberPage> createState() => _VerifyPhoneNumberPageState();
}

class _VerifyPhoneNumberPageState extends State<VerifyPhoneNumberPage> {
  final TextEditingController _pinController = TextEditingController();
  late Timer otpTimer;
  int remainingTime = 300;

  @override
  void initState() {
    super.initState();
    startOtpTimer();
  }

  void startOtpTimer() {
    otpTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        otpTimer.cancel();
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    otpTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onCompleted(String value) async {
      await showDialog(
        context: context,
        builder: (context) => const MessageDialog(
            title: 'Yay!',
            description:
                'You’ve successfully verified your\nKinderTown account.',
            textButton: 'Alright!'),
      ).then((value) {
        otpTimer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const ReferralCodePage(),
            ));
      });
    }

    void onPressedResend() {
      otpTimer.cancel();
      setState(() {
        remainingTime = 300;
        startOtpTimer();
      });
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PrimaryPageBackground(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: height30 * 2,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: PrimaryBackButton(),
                ),
                TitleColumn(
                    title: 'Verify It\'s you',
                    description:
                        'To activate your account, please enter\nthe six digit-code we’ve sent to your\nphone number +60${widget.phoneNumber.substring(0, 2)}-xxx ${widget.phoneNumber.substring(widget.phoneNumber.length - 5, widget.phoneNumber.length)}'),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Pinput(
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: defaultPinTheme,
                        controller: _pinController,
                        length: 6,
                        autofocus: true,
                        separatorBuilder: (index) {
                          return SizedBox(
                            width: width10 * 1.8,
                          );
                        },
                        onCompleted: onCompleted,
                      ),
                      SizedBox(
                        height: height10 * 5.2,
                      ),
                      _otpTimerText(remainingTime),
                    ],
                  ),
                ),
                Text(
                  'Didn’t receive the code?',
                  style: textMd.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                UnderlinedTextButton(
                    onPressed: onPressedResend,
                    textColor: yellowPrimary,
                    text: 'Resend'),
                SizedBox(
                  height: height100 * 1.33,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _otpTimerText(int remainingTime) {
  int minutes = remainingTime ~/ 60;
  int seconds = remainingTime % 60;
  String time =
      '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'The OTP will be expired in ',
          style: textMd.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        TextSpan(
          text: time,
          style: textMd.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
    textAlign: TextAlign.center,
  );
}

final defaultPinTheme = PinTheme(
  width: width10 * 5,
  height: height10 * 7,
  textStyle: textXXL.copyWith(
    fontSize: height10 * 4.8,
    fontWeight: FontWeight.w700,
  ),
  decoration: BoxDecoration(
    color: backgroundColor,
    boxShadow: const [
      BoxShadow(
        color: Color(0x3F000000),
        blurRadius: 4,
        offset: Offset(0, 4),
        spreadRadius: 0,
      )
    ],
    borderRadius: BorderRadius.circular(10),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: purplePrimary),
);
