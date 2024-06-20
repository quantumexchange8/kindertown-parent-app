import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_page_background.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/fill_reservation_detail_first_page.dart';

class ChooseRolePage extends StatelessWidget {
  const ChooseRolePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> roleList = [
      {
        'role': 'Mom',
        'image': 'assets/images/reservation/mom.png',
      },
      {
        'role': 'Dad',
        'image': 'assets/images/reservation/dad.png',
      },
      {
        'role': 'Guardian',
        'image': 'assets/images/reservation/guardian.png',
      },
    ];

    void onTapRole() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FillReservationDetailFirstPage(),
          ));
    }

    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Reservation',
        textAlign: TextAlign.center,
        style: textLg.copyWith(fontWeight: FontWeight.w700),
      )),
      body: PrimaryPageBackground(
        padding: EdgeInsets.symmetric(horizontal: width30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _titleColumn,
            SizedBox(
              height: height30,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: width10 * 3,
              runSpacing: height10,
              children: roleList
                  .map((e) => InkWell(
                      onTap: onTapRole,
                      child: _roleColumn(
                          roleImage: e['image'], roleName: e['role'])))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

Column _titleColumn = Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    Text(
      'Your Role',
      textAlign: TextAlign.center,
      style: textXXL.copyWith(
        fontSize: height20 * 2,
        fontWeight: FontWeight.w900,
      ),
    ),
    SizedBox(height: height10),
    Text(
      'I’m a super-duper...',
      textAlign: TextAlign.center,
      style: textMd.copyWith(
        fontSize: height10 * 1.7,
        fontWeight: FontWeight.w500,
      ),
    ),
  ],
);

Column _roleColumn({
  required String roleImage,
  required String roleName,
}) {
  return Column(
    children: [
      Image.asset(
        roleImage,
        height: height100 * 1.78,
        fit: BoxFit.fitHeight,
      ),
      Text(
        roleName,
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
