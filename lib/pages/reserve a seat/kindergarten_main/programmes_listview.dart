import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/programme.dart';
import 'package:kindertown_parent_app/pages/programme_page.dart';
import 'package:kindertown_parent_app/pages/widgets/programme_container.dart';

const List<Map<String, dynamic>> programmeListConst = [
  {
    'icon_address': 'assets/icons/kindergarten/primary_icon.png',
    'title': 'Full-day programme',
  },
  {
    'icon_address': 'assets/icons/kindergarten/confidence_icon.png',
    'title': 'Culture Talent programme',
  },
  {
    'icon_address': 'assets/icons/kindergarten/hand_print_icon.png',
    'title': 'Enrichment programme',
  }
];

class ProgrammesListview extends StatelessWidget {
  final List<Programme> programmeList;
  const ProgrammesListview({super.key, required this.programmeList});

  @override
  Widget build(BuildContext context) {
    void onTapLink() {}
    List<Widget> children = [];

    children.addAll(programmeListConst.mapIndexed((i, e) => Padding(
          padding: EdgeInsets.only(
              bottom: isLast(i, programmeListConst.length) ? 0 : height24 / 2),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProgrammePage(
                        programme: programmeList.firstWhere((element) =>
                            element.name.toLowerCase() ==
                            e['title'].toLowerCase())),
                  ));
            },
            child: ProgrammeContainer(
              iconAddress: e['icon_address'],
              title: e['title'],
            ),
          ),
        )));
    children.add(Padding(
      padding: EdgeInsets.only(top: height24),
      child: _moreInformationColumn(onTapLink: onTapLink),
    ));

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: height30, horizontal: width24),
      children: children,
    );
  }
}

Column _moreInformationColumn({void Function()? onTapLink}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'For more information, kindly',
        textAlign: TextAlign.center,
        style: textMd.copyWith(
          fontSize: height10 * 1.7,
          fontWeight: FontWeight.w700,
        ),
      ),
      InkWell(
        onTap: onTapLink,
        child: Text(
          'contact the kindergarten',
          textAlign: TextAlign.center,
          style: textMd.copyWith(
            color: const Color(0xFF214DBF),
            fontSize: 17,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    ],
  );
}
