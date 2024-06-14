import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/programme.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/kindergarten_main/programme_page.dart';

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

    children.addAll(programmeListConst.map((e) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProgrammePage(
                      programme: programmeList.firstWhere((element) =>
                          element.name.toLowerCase() ==
                          e['name'].toLowerCase())),
                ));
          },
          child: _programmeContainer(
            iconAddress: e['icon_address'],
            title: e['title'],
          ),
        )));
    children.add(_moreInformationColumn(onTapLink: onTapLink));

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: height30),
      children: children,
    );
  }
}

Container _programmeContainer({
  required String iconAddress,
  required String title,
}) {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: width24, vertical: height10 * 1.8),
    decoration: ShapeDecoration(
      color: Colors.white.withOpacity(0.85),
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFF67F00)),
        borderRadius: BorderRadius.circular(24),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              iconAddress,
              height: height10 * 2.8,
              fit: BoxFit.fitHeight,
            ),
            SizedBox(width: width08 * 2),
            Text(
              title,
              style: textMd.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Icon(
          Icons.arrow_forward_ios_rounded,
          color: orangePrimary,
          size: height24,
        ),
      ],
    ),
  );
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
