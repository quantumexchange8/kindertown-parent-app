import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/secondary_page_background.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/mail.dart';

class MessagePage extends StatelessWidget {
  final Mail mail;
  const MessagePage({super.key, required this.mail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Message',
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
        ),
      )),
      backgroundColor: backgroundColor,
      body: SecondaryPageBackground(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: height30, horizontal: width20),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width24, vertical: height20),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd/MM/yyyy H:mma').format(mail.createdAt),
                      style: textXS.copyWith(
                        color: const Color(0xFF898A8D),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: height08 * 2),
                    Text(
                      mail.title,
                      style: textXL.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.20,
                      ),
                    ),
                    SizedBox(height: height20 * 2),
                    Text(
                      mail.body,
                      style: textSm.copyWith(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.70,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
