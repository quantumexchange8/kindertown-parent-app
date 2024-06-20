import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class HaveFileContainer extends StatelessWidget {
  final String? iconAddress;
  final File file;
  const HaveFileContainer({super.key, this.iconAddress, required this.file});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFileSizeInMB(file),
        builder: (context, snap) {
          final fileSizeInMB = snap.data ?? 0;

          return PrimaryContainer(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
                vertical: height10 * 1.4, horizontal: width10 * 2.5),
            child: Row(
              children: [
                Image.asset(
                  iconAddress ?? 'assets/icons/file_picked.png',
                  height: height20 * 2,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  width: width24 / 2,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getBaseName(file.path),
                      style: textSm.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: height08 / 2,
                    ),
                    Text(
                      '${fileSizeInMB.toStringAsFixed(2)}MB',
                      style: textXS.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
