import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/models/kid_status/check_out.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/content_tile.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/status_container.dart';

class CheckoutRow extends StatelessWidget {
  final CheckoutStatus checkoutStatus;
  final bool isLast;
  const CheckoutRow(
      {super.key, required this.checkoutStatus, required this.isLast});

  @override
  Widget build(BuildContext context) {
    Widget? statusContainer;

    if (checkoutStatus.reason != null) {
      statusContainer = StatusContainer(
          backgroundColor: Color(0xFFFFF1F1),
          borderColor: redPrimary,
          text: checkoutStatus.reason!);
    }

    return ContentTile(
      isLast: isLast,
      statusIconAddress: 'assets/icons/kid_status/check_out_icon.png',
      status: 'Checked out',
      startTime: checkoutStatus.time,
      statusComment: checkoutStatus.comment,
      from: checkoutStatus.from,
      createdAt: checkoutStatus.createdAt,
      statusContainer: statusContainer,
    );
  }
}
