import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/kid_status/status_comment.dart';
import 'package:kindertown_parent_app/models/teacher.dart';

class CommentRow extends StatelessWidget {
  final DateTime createdAt;
  final Teacher from;
  final StatusComment? statusComment;
  const CommentRow(
      {super.key,
      required this.from,
      required this.statusComment,
      required this.createdAt});

  @override
  Widget build(BuildContext context) {
    Text createdAtText = Text(
      'Add by ${from.name} at ${DateFormat('H:mma').format(createdAt)}',
      style: textXS.copyWith(
        color: const Color(0xFF898A8D),
        fontWeight: FontWeight.w700,
        height: 0,
      ),
    );

    if (statusComment != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: height24),
            child: Container(
              width: height20,
              height: height20,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(from.profilePicture),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: width10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                from.name,
                style: textMd.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 0.80,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height10 * 0.9),
                child: Container(
                  padding: EdgeInsets.all(height10),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFE8C1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: orangePrimary,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (statusComment!.comment != null)
                        Text(
                          statusComment!.comment!,
                          style: textSm.copyWith(fontWeight: FontWeight.w600),
                        ),
                      if (statusComment!.comment != null &&
                          statusComment!.image != null)
                        SizedBox(height: height10 * 0.9),
                      if (statusComment!.image != null)
                        Container(
                          width: width100 * 2.36,
                          height: height100 * 3.24,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                                image: NetworkImage(statusComment!.image!),
                                fit: BoxFit.cover),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              createdAtText,
            ],
          ),
        ],
      );
    } else {
      return createdAtText;
    }
  }
}
