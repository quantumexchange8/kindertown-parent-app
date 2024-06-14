import 'package:collection/collection.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/teacher.dart';

class TheTeamContainer extends StatelessWidget {
  final List<Teacher> teacherList;
  const TheTeamContainer({super.key, required this.teacherList});

  @override
  Widget build(BuildContext context) {
    final principle = teacherList.firstWhere(
        (element) => element.role.toLowerCase().contains('principle'));
    final remainingTeacher = teacherList
        .where((element) => !element.role.toLowerCase().contains('principle'))
        .toList();

    return PrimaryContainer(
      padding: EdgeInsets.symmetric(
        vertical: height10 * 2.6,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width24),
            child: _principleRow(teacher: principle),
          ),
          SizedBox(
            height: height30,
          ),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: width24),
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: remainingTeacher
                  .mapIndexed((i, e) => Padding(
                        padding: EdgeInsets.only(
                            right: isLast(i, remainingTeacher.length)
                                ? 0
                                : width20),
                        child: _teacherColumn(teacher: e),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

Row _principleRow({
  required Teacher teacher,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: height100 * 1.2,
        height: height100 * 1.2,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white),
            image:
                DecorationImage(image: NetworkImage(teacher.profilePicture))),
        child: DottedBorder(
          borderType: BorderType.Circle,
          color: yellowPrimary,
          strokeWidth: 3,
          dashPattern: const [5, 5],
          child: Container(),
        ),
      ),
      SizedBox(width: width24 - width10),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              teacher.name,
              style: textLg.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              teacher.role,
              style: textSm.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Column _teacherColumn({required Teacher teacher}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: height30 * 2,
        height: height30 * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(teacher.profilePicture),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: yellowPrimary,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
      ),
      SizedBox(height: height08),
      Text(
        '${teacher.role.capitalizeFirst} \n${teacher.name}',
        textAlign: TextAlign.center,
        style: textXS.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
