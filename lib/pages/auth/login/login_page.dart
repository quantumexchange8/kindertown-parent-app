import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/component/textlabel_with_textfield_column.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/auth/login/underlined_textbutton.dart';
import 'package:kindertown_parent_app/pages/auth/widgets/title_column.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isValid =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

    void pressedForgotPassword() {}

    void pressedSignIn() {}

    void pressedCreateAccount() {}

    return Scaffold(
      body: PrimaryPageBackground(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: BackButton(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleColumn(
                    title: 'Welcome!',
                    description:
                        'Please enter your email address and password for KinderTown Parents account.'),
                SizedBox(
                  height: height30 * 2,
                ),
                TextlabelWithTextfieldColumn(
                  textLabel: 'Email address:',
                  controller: _emailController,
                ),
                SizedBox(
                  height: height20 * 2,
                ),
                TextlabelWithTextfieldColumn(
                  textLabel: 'Password:',
                  controller: _passwordController,
                ),
                SizedBox(
                  height: height08,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: UnderlinedTextButton(
                      onPressed: pressedForgotPassword,
                      text: 'Forgot Password?'),
                ),
                SizedBox(
                  height: height10 * 5.5,
                ),
                PrimaryTextButton(
                    onPressed: isValid ? pressedSignIn : null,
                    width: width100 * 2.87,
                    isDisabled: !isValid,
                    buttonText: 'Sign In'),
                SizedBox(
                  height: height10 * 1.7,
                ),
                Text(
                  'OR',
                  style: textMd.copyWith(
                      fontSize: height10 * 1.7, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height05),
                  child: Text(
                    'New to KinderTown Parents?',
                    textAlign: TextAlign.center,
                    style: textMd.copyWith(
                      fontSize: height10 * 1.7,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                UnderlinedTextButton(
                    onPressed: pressedCreateAccount,
                    textColor: orangePrimary,
                    text: 'Create an account')
              ],
            )
          ],
        ),
      ),
    );
  }
}
