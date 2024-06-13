import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class TitleWithUploadFileColumn extends StatelessWidget {
  final void Function(File? file) onSelectFile;
  final File? file;
  final String title;
  final String buttonText;
  const TitleWithUploadFileColumn(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.onSelectFile,
      this.file});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textLg.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: height45,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            file == null
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/icons/upload-cloud-01.png',
                        height: height10 * 7.8,
                        fit: BoxFit.fitHeight,
                      ),
                      Text(
                        'Maximum file size: 5MB',
                        textAlign: TextAlign.center,
                        style: textXS.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                : FutureBuilder(
                    future: getFileSizeInMB(file!),
                    builder: (context, snap) {
                      return _haveFileContainer(
                          fileName: getBaseName(file!.path),
                          fileSizeInMB: snap.data ?? 0);
                    }),
            PrimaryTextButton(
                onPressed: () async {
                  try {
                    await FilePicker.platform.pickFiles().then((value) {
                      if (value == null) {
                        onSelectFile(null);
                        return;
                      }
                      final path = value.files.first.path;
                      if (path == null) {
                        onSelectFile(null);
                        return;
                      }
                      final file = File(path);
                      onSelectFile(file);
                      return;
                    });
                    // ignore: unused_catch_clause
                  } on Exception catch (e) {
                    onSelectFile(null);
                    return;
                  }
                },
                width: width100 * 2.11,
                buttonText: file == null ? buttonText : 'Change File')
          ],
        )
      ],
    );
  }
}

Widget _haveFileContainer(
    {required String fileName, required double fileSizeInMB}) {
  return PrimaryContainer(
    padding: EdgeInsets.symmetric(
        vertical: height10 * 1.4, horizontal: width10 * 2.5),
    child: Row(
      children: [
        Image.asset(
          'assets/icons/file_picked.png',
          height: height20 * 2,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(
          width: width24 / 2,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              fileName,
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
}
