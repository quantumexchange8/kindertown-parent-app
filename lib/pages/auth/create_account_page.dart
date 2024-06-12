import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/message_dialog.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/component/textlabel_with_textfield_column.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/helper/validator.dart';
import 'package:kindertown_parent_app/pages/auth/verify_phone_number_page.dart';
import 'package:kindertown_parent_app/pages/auth/widgets/title_column.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  String? validateText;

  @override
  Widget build(BuildContext context) {
    bool isValid = _usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty;

    void onPressedContinue() async {
      validateText = validateEmail(_emailController.text);
      if (validateText != null) {
        await showDialog(
          context: context,
          builder: (context) => MessageDialog(
              title: 'Invalid Input',
              description: validateText!,
              textButton: 'OK'),
        );
        return;
      }
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VerifyPhoneNumberPage(phoneNumber: _phoneController.text),
          ));
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          padding: EdgeInsets.zero,
          child: PrimaryPageBackground(
            padding: EdgeInsets.symmetric(
              horizontal: width24 / 2,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: height30,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: BackButton(),
                  ),
                  SizedBox(
                    height: height31,
                  ),
                  const TitleColumn(
                      title: 'Create Account',
                      description:
                          'To continue, please create a KinderTown account.'),
                  SizedBox(
                    height: height10 * 7.2,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width24),
                    child: Column(
                      children: [
                        TextlabelWithTextfieldColumn(
                          focusNode: _usernameFocus,
                          textLabel: 'Username:',
                          controller: _usernameController,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: height20 * 2),
                          child: TextlabelWithTextfieldColumn(
                            focusNode: _emailFocus,
                            keyboardType: TextInputType.emailAddress,
                            textLabel: 'Email address:',
                            controller: _emailController,
                          ),
                        ),
                        TextlabelWithTextfieldColumn(
                          focusNode: _phoneFocus,
                          keyboardType: TextInputType.number,
                          prefixText: '+60',
                          prefixStyle: textMd.copyWith(
                              fontSize: height10 * 1.8,
                              fontWeight: FontWeight.w800),
                          textLabel: 'Phone number:',
                          controller: _phoneController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height10 * 7,
                  ),
                  PrimaryTextButton(
                      width: width100 * 2.87,
                      isDisabled: !isValid,
                      onPressed: onPressedContinue,
                      buttonText: 'Continue')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
