import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/component/primary_dropdown_textfield.dart';
import 'package:kindertown_parent_app/component/textlabel_with_textfield_column.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/data_class/kid_register_info.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/date_of_birth_column.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/title_with_radio_button_column.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/title_with_upload_file_column.dart';

class KidsFormContainer extends StatelessWidget {
  final void Function(String newGender) onTapGender;
  final void Function(String yesNo) onTickYesNo;
  final void Function(File? newFIle) onSelectFile;
  final KidRegisterInfo kidRegisterInfo;
  const KidsFormContainer(
      {super.key,
      required this.onTapGender,
      required this.onTickYesNo,
      required this.onSelectFile,
      required this.kidRegisterInfo});

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      color: Colors.white,
      padding:
          EdgeInsets.symmetric(vertical: height08 * 2, horizontal: width20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextlabelWithTextfieldColumn(
            textLabel: '*Full name:',
            focusNode: kidRegisterInfo.fullNameFocus,
            controller: kidRegisterInfo.fullNameController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height20 * 2),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextlabelWithTextfieldColumn(
                    textLabel: ' Chinese name:',
                    focusNode: kidRegisterInfo.chineseNameFocus,
                    controller: kidRegisterInfo.chineseController,
                  ),
                ),
                SizedBox(
                  width: width24,
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '*Gender:',
                        style: textLg.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: height24 / 4,
                      ),
                      PrimaryDropdownTextfield(
                          items: const ['Male', 'Female'],
                          selectedItem: kidRegisterInfo.gender,
                          onTapItem: onTapGender)
                    ],
                  ),
                ),
              ],
            ),
          ),
          DateOfBirthColumn(
            dayFocusNode: kidRegisterInfo.dayFocusNode,
            dayController: kidRegisterInfo.dayController,
            monthFocusNode: kidRegisterInfo.monthFocusNode,
            monthController: kidRegisterInfo.monthController,
            yearFocusNode: kidRegisterInfo.yearFocusNode,
            yearController: kidRegisterInfo.yearController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height20 * 2),
            child: TitleWithRadioButtonColumn(
                title: '*Is your kid a citizen of Malaysia?',
                items: const ['Yes', 'No'],
                selectedItem: kidRegisterInfo.isMalaysiaCitizen,
                onTick: onTickYesNo),
          ),
          TitleWithUploadFileColumn(
              file: kidRegisterInfo.file,
              title: '*Child’s birth certificate:',
              buttonText: 'Choose File',
              onSelectFile: onSelectFile),
          SizedBox(
            height: height10 * 5,
          )
        ],
      ),
    );
  }
}
