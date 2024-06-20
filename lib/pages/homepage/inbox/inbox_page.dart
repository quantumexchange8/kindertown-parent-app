import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/controller/controller.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/mail.dart';
import 'package:kindertown_parent_app/pages/homepage/inbox/mail_sort_by_bottomsheet.dart';
import 'package:kindertown_parent_app/pages/homepage/inbox/message_page.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  String? filter;

  @override
  Widget build(BuildContext context) {
    void onTapSort() async {
      await showModalBottomSheet(
        context: context,
        builder: (context) => MailSortByBottomsheet(filter: filter),
      ).then((value) {
        if (value != null) {
          setState(() {
            filter = value;
          });
        }
      });
    }

    void onPressedViewMore(Mail mail) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MessagePage(mail: mail),
          ));
    }

    return Obx(() {
      List<Mail> mailList = homeController.mailList;

      if (filter != null) {
        if (filter == 'kindertown') {
          mailList = mailList.where((mail) => mail.from == 'system').toList();
        } else {
          mailList =
              mailList.where((mail) => !(mail.from == 'system')).toList();
        }
      }

      return Scaffold(
        appBar: primaryAppbar(
            title: Text(
          'Inbox',
          textAlign: TextAlign.center,
          style: textLg.copyWith(
            fontWeight: FontWeight.w700,
          ),
        )),
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/bottom_background.png',
                height: height100 * 4.43,
                width: screenWidth,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: onTapSort,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: height20,
                        width: height20,
                        child: Stack(
                          children: [
                            Icon(
                              Icons.filter_alt_sharp,
                              size: height20,
                              color: purplePrimary,
                            ),
                            if (filter != null)
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Icon(
                                  Icons.check_circle,
                                  color: orangePrimary,
                                  size: height08,
                                ),
                              )
                          ],
                        ),
                      ),
                      Text(
                        'Sort',
                        style: textXL.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: mailList.length,
                    itemBuilder: (context, index) {
                      final mail = mailList[index];
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom:
                                isLast(index, mailList.length) ? 0 : height10),
                        child: _mailContainer(
                            onPressedViewMore: () {
                              onPressedViewMore(mail);
                            },
                            mail: mail),
                      );
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}

Container _mailContainer(
    {required Mail mail, required void Function()? onPressedViewMore}) {
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
              TextButton(
                onPressed: onPressedViewMore,
                child: Text(
                  'view more >>',
                  textAlign: TextAlign.right,
                  style: textXS.copyWith(
                    color: themeColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
