import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/message_dialog.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/component/textlabel_with_textfield_column.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/validator.dart';
import 'package:kindertown_parent_app/pages/auth/widgets/title_column.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reEnterPasswordController =
      TextEditingController();
  String? _passwordErrorText;
  String? _reEnterPasswordErrorText;

  @override
  Widget build(BuildContext context) {
    bool isDisabled = _passwordController.text.isEmpty ||
        _reEnterPasswordController.text.isEmpty;

    void onPressedSignUp() async {
      setState(() {
        _passwordErrorText = validatePassword(_passwordController.text);
        if (_passwordController.text != _reEnterPasswordController.text) {
          _reEnterPasswordErrorText = 'Password not match';
        } else {
          _reEnterPasswordErrorText = null;
        }
      });
      if (_passwordErrorText == null || _reEnterPasswordErrorText == null) {
        await showDialog(
          context: context,
          builder: (context) => const MessageDialog(
              title: 'You\'re all set!',
              description: 'You\'ve created an account in\nKinderTown.',
              textButton: 'Continue'),
        ).then((value) {});
      }
    }

    return Scaffold(
      body: PrimaryPageBackground(
        child: Column(
          children: [
            Align(
              child: BackButton(),
            ),
            SizedBox(
              height: height31,
            ),
            TitleColumn(
                title: 'Create Password',
                description:
                    'Your password must contain 8-12\ncharacters and an upper case letter.'),
            SizedBox(
              height: height100 * 1.39,
            ),
            TextlabelWithTextfieldColumn(
              textLabel: 'Password:',
              controller: _passwordController,
              errorText: _passwordErrorText,
            ),
            SizedBox(
              height: height31,
            ),
            TextlabelWithTextfieldColumn(
              textLabel: 'Re-enter password:',
              controller: _reEnterPasswordController,
              errorText: _reEnterPasswordErrorText,
            ),
            SizedBox(
              height: height10 * 7,
            ),
            PrimaryTextButton(
                isDisabled: isDisabled,
                onPressed: isDisabled ? null : onPressedSignUp,
                width: width100 * 2.07,
                buttonText: 'Sign Up')
          ],
        ),
      ),
    );
  }
}
