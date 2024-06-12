import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/back_button.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/component/textlabel_with_textfield_column.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/auth/widgets/title_column.dart';
import 'package:kindertown_parent_app/pages/onboarding/hello_page.dart';

class ReferralCodePage extends StatefulWidget {
  const ReferralCodePage({super.key});

  @override
  State<ReferralCodePage> createState() => _ReferralCodePageState();
}

class _ReferralCodePageState extends State<ReferralCodePage> {
  final TextEditingController _codeController = TextEditingController();
  final FocusNode _codeFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    bool isDisabled = _codeController.text.isEmpty;

    void onPressedContinue() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HelloPage(),
          ));
    }

    void onPressedSkip() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HelloPage(),
          ));
    }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PrimaryPageBackground(
          padding: EdgeInsets.symmetric(horizontal: width24 / 2),
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
                const TitleColumn(
                    title: 'Referral Code',
                    description:
                        'Did you receive any referral code from someone you know?'),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: height100 * 1.25, horizontal: width24),
                  child: TextlabelWithTextfieldColumn(
                    focusNode: _codeFocus,
                    textLabel: 'Code:',
                    controller: _codeController,
                  ),
                ),
                PrimaryTextButton(
                    onPressed: isDisabled ? null : onPressedContinue,
                    isDisabled: isDisabled,
                    width: width100 * 2.87,
                    buttonText: 'Continue'),
                SizedBox(
                  height: height10 * 4.7,
                ),
                TextButton(
                    onPressed: onPressedSkip,
                    child: Text(
                      'Skip',
                      style: textMd.copyWith(
                          fontWeight: FontWeight.w500, color: orangePrimary),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
