import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/kid_status/status_comment.dart';
import 'package:kindertown_parent_app/models/teacher.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/comment_row.dart';

class ContentTile extends StatelessWidget {
  final bool isLast;
  final String statusIconAddress;
  final String status;
  final DateTime startTime;
  final DateTime? endTime;
  final Widget? statusContainer;
  final Teacher from;
  final StatusComment? statusComment;
  final DateTime createdAt;
  const ContentTile(
      {super.key,
      required this.statusIconAddress,
      required this.status,
      required this.startTime,
      this.endTime,
      this.statusContainer,
      required this.statusComment,
      required this.from,
      required this.createdAt,
      required this.isLast});

  @override
  Widget build(BuildContext context) {
    final double lineLength;

    if (statusComment != null) {
      if (statusComment!.comment != null && statusComment!.image != null) {
        lineLength = height100 * 5.14;
      } else {
        if (statusComment!.image != null) {
          lineLength = height100 * 3.55;
        } else {
          lineLength = height100 * 2.04;
        }
      }
    } else {
      lineLength = height10 * 7.2;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              decoration: const ShapeDecoration(
                color: yellowPrimary,
                shape: OvalBorder(
                  side: BorderSide(color: Colors.white),
                ),
              ),
              child: DottedBorder(
                color: redPrimary,
                strokeWidth: 2,
                dashPattern: const [3, 3],
                borderPadding: const EdgeInsets.all(2),
                borderType: BorderType.Circle,
                padding: EdgeInsets.all(height05),
                child: Image.asset(
                  statusIconAddress,
                  height: height20,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(width: width10),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    status,
                    style: textLg.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                  Text(
                    endTime != null
                        ? '${DateFormat('HH:mma').format(startTime)} - ${DateFormat('HH:mma').format(endTime!)} '
                        : DateFormat('HH:mma').format(startTime),
                    style: textXS.copyWith(
                      color: orangePrimary,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ],
              ),
            ),
            if (statusContainer != null) statusContainer!,
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width20),
              child: isLast
                  ? Container()
                  : DottedLine(
                      direction: Axis.vertical,
                      dashColor: yellowPrimary,
                      dashGapLength: height08 / 4,
                      dashLength: height08 / 2,
                      lineThickness: 3,
                      lineLength: lineLength,
                    ),
            ),
            SizedBox(width: width10 * 3.4),
            Padding(
              padding: EdgeInsets.only(top: height10 * 1.8),
              child: CommentRow(
                  from: from,
                  statusComment: statusComment,
                  createdAt: createdAt),
            )
          ],
        )
      ],
    );
  }
}
