import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_dialog.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class MessageDialog extends StatelessWidget {
  final String title;
  final String description;
  final String textButton;
  const MessageDialog(
      {super.key,
      required this.title,
      required this.description,
      required this.textButton});

  @override
  Widget build(BuildContext context) {
    return PrimaryDialog(
      padding: EdgeInsets.symmetric(
          horizontal: width10 * 3.5, vertical: height10 * 4.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: textLg.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: height10 * 1.8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: textMd.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: height08 * 2),
          PrimaryTextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              width: width100 * 2.07,
              buttonText: textButton)
        ],
      ),
    );
  }
}
