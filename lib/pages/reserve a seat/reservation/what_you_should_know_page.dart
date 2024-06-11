import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

const List<Map<String, dynamic>> whatYouShouldKnow = [
  {
    "title": "Detail and document required",
    "image": "assets/images/reservation/how_to_upload_document.png",
    "description":
        "To reserve a seat in kindergarten, you’ll need to provide the kindergarten with the detail of your kid and yourself (parents or guardian). You need to upload your identity documents to ensure that all the information you've entered for the reservation is correct.",
  },
  {
    "title": "Payment",
    "image": "assets/images/reservation/how_payment.png",
    "description":
        "During the reservation, you’ll need to pay for a certain amount of deposit to secure your reservation. The deposit shall be deducted from your full payment when you’re making physical registration.",
  },
  {
    "title": "Physical Registration",
    "image": "assets/images/reservation/how_physical.png",
    "description":
        "The kindergarten will contact you and ask for your available date and time for physical registration in 2-3 working days. You’ll be informed about what to prepare and bring on the day of registration.",
  },
  {
    "title": "Successful enrolment in kindergarten",
    "image": "assets/images/reservation/great_news.png",
    "description":
        "Once you’ve done the physical registration and successfully enrol your kid as a student of kindergarten, the admin will upload all your kids’ academic details onto KinderTown. By that time you can enjoy using KinderTown as usual. Stay tuned!",
  },
];

class WhatYouShouldKnowPage extends StatelessWidget {
  const WhatYouShouldKnowPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onPressedGoodToGo() {}

    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Reservation',
        style: textLg.copyWith(fontWeight: FontWeight.w700),
      )),
      body: ListView(
        padding:
            EdgeInsets.symmetric(horizontal: width24 / 2, vertical: height31),
        children: [
          Stack(
            children: [
              PrimaryContainer(
                padding: EdgeInsets.symmetric(
                    vertical: height31, horizontal: width08 * 2),
                child: Column(
                  children: [
                    _titleColumn,
                    SizedBox(
                      height: height30 * 2,
                    ),
                    ...whatYouShouldKnow.mapIndexed((i, e) => Padding(
                          padding: EdgeInsets.only(
                              bottom: isLast(i, whatYouShouldKnow.length)
                                  ? 0
                                  : height30 * 2),
                          child: _contentColumn(
                              index: i,
                              title: e['title'],
                              image: e['image'],
                              description: e['description']),
                        ))
                  ],
                ),
              ),
              Positioned(
                right: width10,
                bottom: height10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/reservation/sallotape_left.png',
                      height: height10 * 6.5,
                      fit: BoxFit.fitHeight,
                    ),
                    SizedBox(
                      width: width10 * 9.7,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: height10 * 1.7),
                      child: Image.asset(
                        'assets/images/reservation/bulb_help.png',
                        height: height10 * 8.1,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    SizedBox(
                      width: width10 * 9.7,
                    ),
                    Image.asset(
                      'assets/images/reservation/sallotape_right.png',
                      height: height10 * 6.5,
                      fit: BoxFit.fitHeight,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: height10 * 5,
          ),
          PrimaryTextButton(
              onPressed: onPressedGoodToGo,
              width: width100 * 2.39,
              buttonText: 'I\'m goo to go!')
        ],
      ),
    );
  }
}

Column _titleColumn = Column(
  children: [
    Text(
      'What You Should Know',
      textAlign: TextAlign.center,
      style: textXXL.copyWith(
        fontSize: height20 * 2,
        fontWeight: FontWeight.w900,
      ),
    ),
    Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            left: width20,
            child: Container(
              width: width100,
              height: height20,
              decoration: BoxDecoration(
                  color: const Color(0xFFAF00D3).withOpacity(0.06),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 3),
                        blurRadius: 10,
                        spreadRadius: 10)
                  ]),
            )),
        Text(
          'before making a reservation',
          textAlign: TextAlign.center,
          style: textMd.copyWith(
            fontSize: height15,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  ],
);

Column _contentColumn(
    {required int index,
    required String title,
    required String image,
    required String description}) {
  return Column(
    children: [
      Text(
        '${index + 1}. $title',
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      Image.asset(
        image,
        height: height100 * 2.97,
        fit: BoxFit.fitHeight,
      ),
      Text(
        description,
        style: textMd.copyWith(
          fontSize: height15,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.75,
        ),
      ),
    ],
  );
}
