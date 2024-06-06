import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_iconbutton.dart';
import 'package:kindertown_parent_app/pages/onboarding/widgets/select_language_dialog.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryIconButton(
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (context) => const SelectLanguageDialog(),
        );
      },
      icon: 'assets/icons/globe-04.png',
    );
  }
}
