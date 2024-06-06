import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_dialog.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

List<Map<String, dynamic>> languageList = [
  {
    'language_name': 'Malay',
    'language_code': 'ms',
  },
  {
    'language_name': 'English',
    'language_code': 'en',
  },
  {
    'language_name': '中文',
    'language_code': 'zh',
  },
];

class SelectLanguageDialog extends StatelessWidget {
  const SelectLanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryDialog(
      padding:
          EdgeInsets.symmetric(horizontal: width30, vertical: height10 * 3.5),
      child: Column(
        children: [
          Text(
            'Select a language',
            textAlign: TextAlign.center,
            style: textXXL.copyWith(
                fontSize: height10 * 2.6, fontWeight: FontWeight.w900),
          ),
          ...languageList.mapIndexed((i, e) => Padding(
                padding: EdgeInsets.only(
                    bottom: isLast(i, languageList.length) ? 0 : height24),
                child: PrimaryTextButton(
                    width: width100 * 2.87, buttonText: e['language_name']),
              ))
        ],
      ),
    );
  }
}
