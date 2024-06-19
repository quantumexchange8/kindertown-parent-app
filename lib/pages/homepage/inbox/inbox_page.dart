import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/mail.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final mailList = homeController.mailList;

      return Scaffold(
        appBar: primaryAppbar(
            title: Text(
          'Inbox',
          textAlign: TextAlign.center,
          style: textLg.copyWith(
            fontWeight: FontWeight.w700,
          ),
        )),
        body: Column(
          children: [
            Row(),
            Expanded(
              child: ListView.builder(
                itemCount: mailList.length,
                itemBuilder: (context, index) {
                  final mail = mailList[index];
                  return _mailContainer(mail);
                },
              ),
            )
          ],
        ),
      );
    });
  }
}

Container _mailContainer(Mail mail) {
  Color themeColor;
  Color backgroundColor = Colors.white;
  if (mail.read) {
    themeColor = const Color(0xFFAFAFAF);
    backgroundColor = const Color(0xFFE9E9E9);
  } else {
    if (mail.from == 'system') {
      themeColor = yellowPrimary;
    } else {
      themeColor = orangePrimary;
    }
  }

  return Container(
    width: width100 * 3.89,
    height: height100 * 1.95,
    decoration: ShapeDecoration(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    child: Row(
      children: [
        Container(
          width: width15,
          height: height100 * 1.95,
          decoration: ShapeDecoration(
            color: themeColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
        ),
        SizedBox(
          width: width08 * 2,
        ),
        Expanded(
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
              Text(
                'from ${mail.from}',
                style: textSm.copyWith(
                  color: orangePrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                mail.title,
                style: textMd.copyWith(
                  color: mail.read ? themeColor : purplePrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: height08 / 2),
              SizedBox(
                height: height10 * 4,
                child: Text(
                  mail.body,
                  style: textXS.copyWith(
                    color: const Color(0xFF898A8D),
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                'view more >>',
                textAlign: TextAlign.right,
                style: textXS.copyWith(
                  color: themeColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
