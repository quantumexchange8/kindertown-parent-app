import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/component/subtitle_container.dart';

class ContentColumn extends StatelessWidget {
  final String iconAddress;
  final String subtitle;
  final Widget content;
  const ContentColumn(
      {super.key,
      required this.iconAddress,
      required this.subtitle,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SubtitleContainer(iconAddress: iconAddress, subtitle: subtitle),
        SizedBox(height: height08 * 2),
        content
      ],
    );
  }
}
