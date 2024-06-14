import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/component/primary_dropdown_textfield.dart';
import 'package:kindertown_parent_app/component/textlabel_with_textfield_column.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/data_class/kid_register_info.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/fill_reservation_detail_second_page.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/date_of_birth_column.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/reservation_detail_page_layout.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/show_select_form_column.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/title_with_radio_button_column.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/title_with_upload_file_column.dart';

class FillReservationDetailFirstPage extends StatefulWidget {
  const FillReservationDetailFirstPage({super.key});

  @override
  State<FillReservationDetailFirstPage> createState() =>
      _FillReservationDetailFirstPageState();
}

class _FillReservationDetailFirstPageState
    extends State<FillReservationDetailFirstPage> {
  List<KidRegisterInfo> kidRegisterInfoList = [];
  List<bool> showFormRegister = [];
  List<int> kidRegisterInfoIDListSelected = [1];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 1; i <= 3; i++) {
      kidRegisterInfoList.add(KidRegisterInfo(
        id: i,
        fullNameFocus: FocusNode(),
        chineseNameFocus: FocusNode(),
        genderFocus: FocusNode(),
        dayFocusNode: FocusNode(),
        monthFocusNode: FocusNode(),
        yearFocusNode: FocusNode(),
        chineseController: TextEditingController(),
        dayController: TextEditingController(),
        fullNameController: TextEditingController(),
        monthController: TextEditingController(),
        yearController: TextEditingController(),
      ));
      showFormRegister.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isNextDisabled = false;
    for (var element in kidRegisterInfoIDListSelected) {
      final kidForm = kidRegisterInfoList.firstWhere((e) => e.id == element);
      if (kidForm.fullNameController.text.isEmpty &&
          kidForm.gender == null &&
          kidForm.dayController.text.isEmpty &&
          kidForm.monthController.text.isEmpty &&
          kidForm.yearController.text.isEmpty &&
          kidForm.isMalaysiaCitizen == null &&
          kidForm.file == null) {
        isNextDisabled = true;
      }
    }

    void onTapContainer(int index) {
      setState(() {
        showFormRegister[index] = !showFormRegister[index];
      });
    }

    void onTickContainer(int id) {
      setState(() {
        if (kidRegisterInfoIDListSelected.contains(id)) {
          kidRegisterInfoIDListSelected.remove(id);
        } else {
          kidRegisterInfoIDListSelected.add(id);
        }
      });
    }

    void onTapGender({required String newGender, required int id}) {
      setState(() {
        kidRegisterInfoList.firstWhere((element) => element.id == id).gender =
            newGender;
      });
    }

    void onTickYesNo({required String yesNo, required int id}) {
      setState(() {
        kidRegisterInfoList
            .firstWhere((element) => element.id == id)
            .isMalaysiaCitizen = yesNo;
      });
    }

    void onSelectFile({required File? newFile, required int id}) {
      setState(() {
        kidRegisterInfoList.firstWhere((element) => element.id == id).file =
            newFile;
      });
    }

    void onPressedNext() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FillReservationDetailSecondPage(),
          ));
    }

    return ReservationDetailPageLayout(
      activeStep: 0,
      title: 'Kid’s Information',
      contents: kidRegisterInfoList.mapIndexed((i, e) {
        final moreThanOne = e.id > 1;

        return Padding(
          padding: EdgeInsets.only(
              bottom: isLast(i, kidRegisterInfoList.length) ? 0 : height10),
          child: ShowSelectFormColumn(
            onTapContainer: () {
              onTapContainer(i);
            },
            onTick: moreThanOne
                ? () {
                    onTickContainer(e.id);
                  }
                : () {},
            subtitle: moreThanOne ? 'Kid ${e.id} (Optional)' : '*Kid 1',
            isTick: moreThanOne
                ? kidRegisterInfoIDListSelected.contains(e.id)
                : true,
            formContainer: _kidsContainer(
                onTapGender: (newGender) {
                  onTapGender(newGender: newGender, id: e.id);
                },
                onTickYesNo: (yesNo) {
                  onTickYesNo(id: e.id, yesNo: yesNo);
                },
                onSelectFile: (newFIle) {
                  onSelectFile(id: e.id, newFile: newFIle);
                },
                kidRegisterInfo: e),
            isVisibleForm: showFormRegister[i],
          ),
        );
      }).toList(),
      onPressedNext: onPressedNext,
      isNextDisabled: isNextDisabled,
    );
  }
}

PrimaryContainer _kidsContainer({
  required void Function(String newGender) onTapGender,
  required void Function(String yesNo) onTickYesNo,
  required void Function(File? newFIle) onSelectFile,
  required KidRegisterInfo kidRegisterInfo,
}) {
  return PrimaryContainer(
    padding: EdgeInsets.symmetric(vertical: height08 * 2, horizontal: width20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextlabelWithTextfieldColumn(
          textLabel: '*Full name:',
          focusNode: kidRegisterInfo.fullNameFocus,
          controller: kidRegisterInfo.fullNameController,
        ),
        Row(
          children: [
            Expanded(
              flex: 3,
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
              flex: 2,
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
                      focusNode: kidRegisterInfo.genderFocus,
                      items: const ['Male', 'Female'],
                      selectedItem: kidRegisterInfo.gender,
                      onTapItem: onTapGender)
                ],
              ),
            ),
          ],
        ),
        DateOfBirthColumn(
          dayFocusNode: kidRegisterInfo.dayFocusNode,
          dayController: kidRegisterInfo.dayController,
          monthFocusNode: kidRegisterInfo.monthFocusNode,
          monthController: kidRegisterInfo.monthController,
          yearFocusNode: kidRegisterInfo.yearFocusNode,
          yearController: kidRegisterInfo.yearController,
        ),
        TitleWithRadioButtonColumn(
            title: '*Is your kid a citizen of Malaysia?',
            items: const ['Yes', 'No'],
            selectedItem: kidRegisterInfo.isMalaysiaCitizen,
            onTick: onTickYesNo),
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
