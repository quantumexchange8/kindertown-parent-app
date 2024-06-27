import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/models/kid_status/photo_status.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/content_tile.dart';
import 'package:kindertown_parent_app/pages/homepage/kid_timeline/widgets/status_container.dart';

class PhotoStatusRow extends StatelessWidget {
  final PhotoStatus photoStatus;
  final bool isLast;
  const PhotoStatusRow(
      {super.key, required this.photoStatus, required this.isLast});

  @override
  Widget build(BuildContext context) {
    String? iconAddress;
    switch (photoStatus.status) {
      case 'feeling happy':
        iconAddress = 'assets/icons/kid_status/laughing_icon.png';
      case 'feeling frustrated':
        iconAddress = 'assets/icons/kid_status/sad_icon.png';

      case 'feeling sad':
        iconAddress = 'assets/icons/kid_status/crying_icon.png';

      case 'feeling angry':
        iconAddress = 'assets/icons/kid_status/angry_icon.png';

        break;
      default:
        iconAddress = 'assets/icons/kid_status/happy_icon.png';
    }

    return ContentTile(
      isLast: isLast,
      statusIconAddress: 'assets/icons/kid_status/camera_icon.png',
      status: 'Photo',
      startTime: photoStatus.startTime,
      endTime: photoStatus.endTime,
      statusComment: photoStatus.comment,
      from: photoStatus.from,
      createdAt: photoStatus.createdAt,
      statusContainer: StatusContainer(
          iconAddress: iconAddress,
          backgroundColor: const Color(0xFFFFF8EA),
          borderColor: const Color(0xFFF9B83C),
          text: photoStatus.status),
    );
  }
}
