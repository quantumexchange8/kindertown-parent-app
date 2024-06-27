import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/models/kid_status/potty.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/content_tile.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/status_container.dart';

class PottyRow extends StatelessWidget {
  final PottyStatus pottyStatus;
  final bool isLast;
  const PottyRow({super.key, required this.pottyStatus, required this.isLast});

  @override
  Widget build(BuildContext context) {
    String? iconAddress;

    switch (pottyStatus.potty) {
      case 'small hard lumps':
        iconAddress = 'assets/icons/kid_status/small_hard_lumps_icon.png';
      case 'lumpy sausage':
        iconAddress = 'assets/icons/kid_status/lumpy_sausage_icon.png';

      case 'mushy stool':
        iconAddress = 'assets/icons/kid_status/mushy_stool_icon.png';

      case 'liquid stool':
        iconAddress = 'assets/icons/kid_status/liquid_stool_icon.png';
        break;
      default:
        iconAddress = 'assets/icons/kid_status/soft_smooth_sausage_icon.png';
    }

    return ContentTile(
      isLast: isLast,
      statusIconAddress: 'assets/icons/kid_status/toilet_paper_icon.png',
      statusComment: pottyStatus.comment,
      status: 'Potty',
      startTime: pottyStatus.startTime,
      endTime: pottyStatus.endTime,
      from: pottyStatus.from,
      createdAt: pottyStatus.createdAt,
      statusContainer: StatusContainer(
          iconAddress: iconAddress,
          backgroundColor: const Color(0xFFFCF0FF),
          borderColor: const Color(0xFF6E0882),
          text: pottyStatus.potty),
    );
  }
}
