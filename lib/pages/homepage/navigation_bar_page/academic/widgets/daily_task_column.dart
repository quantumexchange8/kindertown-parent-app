import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/content_column.dart';
import 'package:kindertown_parent_app/component/primary_tickbox.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/academic/daily_task.dart';

class DailyTaskColumn extends StatelessWidget {
  final List<DailyTask> dailyTasks;
  const DailyTaskColumn({super.key, required this.dailyTasks});

  @override
  Widget build(BuildContext context) {
    return ContentColumn(
        iconAddress: 'assets/icons/missions/homework_icon.png',
        subtitle: 'Daily task',
        content: _dailyTaskContainer(dailyTasks));
  }
}

Widget _dailyTaskContainer(List<DailyTask> dailyTasks) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Padding(
        padding: EdgeInsets.only(top: height10 * 5.4),
        child: Container(
          decoration: ShapeDecoration(
            color: yellowPrimary,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFF67F00)),
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: DottedBorder(
            color: redPrimary,
            borderPadding: const EdgeInsets.all(4),
            padding: EdgeInsets.all(height24 / 2),
            strokeWidth: 3,
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            dashPattern: const [4, 4],
            child: Container(
              padding:
                  EdgeInsets.symmetric(vertical: height30, horizontal: width24),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: height05, horizontal: width08 * 2),
                    decoration: ShapeDecoration(
                      color: yellowPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      DateFormat('dd MMMM yyyy').format(DateTime.now()),
                      style: textXS.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.60,
                      ),
                    ),
                  ),
                  SizedBox(height: height24),
                  ...dailyTasks.map(
                    (e) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PrimaryTickbox(onTap: () {}, isCheck: e.done),
                        SizedBox(width: width15),
                        Expanded(
                          child: Text(
                            e.task,
                            style: textMd.copyWith(
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Image.asset(
          'assets/images/academic/clipper.png',
          width: width100 * 2.29,
          fit: BoxFit.fitWidth,
        ),
      )
    ],
  );
}
