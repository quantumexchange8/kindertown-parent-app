import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/have_file_container.dart';

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
                : HaveFileContainer(file: file!),
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
