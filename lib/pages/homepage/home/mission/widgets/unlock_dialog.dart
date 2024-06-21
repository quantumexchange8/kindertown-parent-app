import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_dialog.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class UnlockDialog extends StatelessWidget {
  const UnlockDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryDialog(
      padding: EdgeInsets.all(height30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: width100 * 2.46,
            child: Text(
              'Are you sure you want to unlock this element?',
              textAlign: TextAlign.center,
              style: textLg.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: height30,
          ),
          PrimaryTextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              width: width100 * 1.64,
              buttonText: 'Unlock'),
          SizedBox(
            height: height15,
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text(
              'Cancel',
              textAlign: TextAlign.center,
              style: textMd.copyWith(
                color: orangePrimary,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }
}
