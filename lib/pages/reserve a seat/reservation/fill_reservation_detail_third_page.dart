import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/fill_reservation_detail_fourth_page.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/agreements_checkbox_row.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/have_file_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/reservation_detail_page_layout.dart';

class FillReservationDetailThirdPage extends StatefulWidget {
  const FillReservationDetailThirdPage({super.key});

  @override
  State<FillReservationDetailThirdPage> createState() =>
      _FillReservationDetailThirdPageState();
}

const List<Map<String, dynamic>> policiesAndAgreements = [
  {
    'title': 'Privacy Policy',
    'asset_path': 'assets/policies_and_agreements/Privacy Policy.pdf'
  },
  {
    'title': 'Terms & Conditions',
    'asset_path': 'assets/policies_and_agreements/Terms & Conditions.pdf'
  },
  {
    'title': 'User Agreement',
    'asset_path': 'assets/policies_and_agreements/User Agreement.pdf'
  },
  {
    'title': 'Parental Consent Agreement',
    'asset_path':
        'assets/policies_and_agreements/Parental Consent Agreement.pdf'
  },
  {
    'title': 'Terms for Registration and Use',
    'asset_path':
        'assets/policies_and_agreements/Terms for Registration and Use.pdf'
  },
];

class _FillReservationDetailThirdPageState
    extends State<FillReservationDetailThirdPage> {
  bool agreeAgreement = false;

  Future<List<Map<String, dynamic>>> getPoliciesFile() async {
    final List<File?> fileList = [];

    for (var element in policiesAndAgreements) {
      fileList.add(await loadFileFromAssets(element['asset_path']));
    }

    return policiesAndAgreements
        .mapIndexed((i, e) => {'title': e['title'], 'file': fileList[i]})
        .toList();
  }

  void onChangedAgree(bool? newAgree) {
    if (newAgree != null) {
      setState(() {
        agreeAgreement = newAgree;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getPoliciesFile(),
        builder: (context, snap) {
          final policiesList = snap.data ?? [];

          return ReservationDetailPageLayout(
              onPressedNext: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const FillReservationDetailFourthPage(),
                  )),
              activeStep: 2,
              title: 'Policies & Agreements',
              contents: [
                ...policiesList.mapIndexed((i, e) => Padding(
                      padding: EdgeInsets.only(
                          bottom: isLast(i, policiesList.length)
                              ? 0
                              : height30 * 2),
                      child: _titleWithFileContainer(
                          title: e['title'], file: e['file']),
                    )),
                SizedBox(
                  height: height10 * 5,
                ),
                AgreementsCheckboxRow(
                    onChanged: onChangedAgree, value: agreeAgreement)
              ],
              isNextDisabled: !agreeAgreement);
        });
  }
}

Column _titleWithFileContainer({
  required String title,
  required File? file,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: width10),
        child: Text(
          title,
          style: textLg.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      SizedBox(
        height: height20,
      ),
      file == null
          ? Text(
              'No File Found',
              style: textLg.copyWith(color: redPrimary),
            )
          : HaveFileContainer(
              file: file,
              iconAddress: 'assets/icons/pdf_icon.png',
            )
    ],
  );
}
