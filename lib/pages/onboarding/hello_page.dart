import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/pages/auth/widgets/title_column.dart';
import 'package:kindertown_parent_app/pages/join_as_kindertown_affiliate/affiliate_homepage.dart';
import 'package:kindertown_parent_app/pages/join_using_invitation_code/enter_invitation_code_page.dart';
import 'package:kindertown_parent_app/pages/onboarding/widgets/step_container.dart';

import '../reserve a seat/search_kindergarten/search_kindergarten_page.dart';

List<Map<String, dynamic>> stepItems = [
  {
    'page': const SearchKindergartenPage(),
    'text': 'Reserve a seat in kindergarten',
    'image': 'assets/images/reserve_a_seat_image.png',
  },
  {
    'page': const EnterInvitationCodePage(),
    'text': 'Join using Invitation code',
    'image': 'assets/images/join_using_code_image.png',
  },
  {
    'page': const AffiliateHomepage(),
    'text': 'Join as a KinderTown Affiliate',
    'image': 'assets/images/join_as_affiliate_image.png',
  },
];

class HelloPage extends StatelessWidget {
  const HelloPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: PrimaryPageBackground(
          padding: EdgeInsets.symmetric(horizontal: width24),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: height10 * 8,
                ),
                const TitleColumn(
                    title: 'Hello!',
                    description: 'Tell us about your next step.'),
                SizedBox(
                  height: height24 * 2,
                ),
                ...stepItems.mapIndexed((i, e) => Padding(
                      padding: EdgeInsets.only(
                          bottom:
                              isLast(i, stepItems.length) ? 0 : height20 * 2),
                      child: InkWell(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => e['page'])),
                        child: StepContainer(
                            isTextLeft: (i + 1).isEven,
                            imageAddress: e['image'],
                            text: e['text']),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
