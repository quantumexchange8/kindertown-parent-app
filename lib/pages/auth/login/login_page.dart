import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/back_button.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/component/textlabel_with_textfield_column.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/auth/create_account_page.dart';
import 'package:kindertown_parent_app/pages/auth/login/underlined_textbutton.dart';
import 'package:kindertown_parent_app/pages/auth/widgets/title_column.dart';
import 'package:kindertown_parent_app/pages/onboarding/hello_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    bool isValid =
        _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    final canPop = Navigator.canPop(context);

    void pressedForgotPassword() {}

    void pressedSignIn() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HelloPage(),
          ));
    }

    void pressedCreateAccount() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateAccountPage(),
          ));
    }

    return PopScope(
      canPop: canPop,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: PrimaryPageBackground(
            padding: EdgeInsets.symmetric(
              horizontal: width24 / 2,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height10 * 7,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: PrimaryBackButton(
                    onPressed: () {
                      if (canPop) {
                        Navigator.pop(context);
                      }
                    },
                  ),
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
                      focusNode: _emailFocus,
                      textLabel: 'Email address:',
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: height20 * 2,
                    ),
                    TextlabelWithTextfieldColumn(
                      obscureText: true,
                      focusNode: _passwordFocus,
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
                          fontSize: height10 * 1.7,
                          fontWeight: FontWeight.w500),
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
        ),
      ),
    );
  }
}
