import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/models/kid_status/nap.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/content_tile.dart';

class NapRow extends StatelessWidget {
  final NapStatus napStatus;
  final bool isLast;
  const NapRow({super.key, required this.napStatus, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return ContentTile(
        isLast: isLast,
        statusIconAddress: 'assets/icons/kid_status/sleeping_icon.png',
        status: 'Nap',
        startTime: napStatus.startTime,
        endTime: napStatus.endTime,
        statusComment: napStatus.comment,
        from: napStatus.from,
        createdAt: napStatus.createdAt);
  }
}
