import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/component/textlabel_with_textfield_column.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/data_class/parent_register_info.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/reservation_detail_page_layout.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/show_select_form_column.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/title_with_upload_file_column.dart';

class FillReservationDetailSecondPage extends StatefulWidget {
  const FillReservationDetailSecondPage({super.key});

  @override
  State<FillReservationDetailSecondPage> createState() =>
      _FillReservationDetailSecondPageState();
}

class _FillReservationDetailSecondPageState
    extends State<FillReservationDetailSecondPage> {
  List<ParentRegisterInfo> parentRegisterInfoList = [];
  List<bool> showFormRegister = [];
  List<int> parentRegisterInfoListIDListSelected = [1];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 1; i <= 2; i++) {
      parentRegisterInfoList.add(ParentRegisterInfo(
        id: i,
        fullNameFocus: FocusNode(),
        contactNoFocus: FocusNode(),
        emailFocus: FocusNode(),
        fullNameController: TextEditingController(),
        contactNoController: TextEditingController(),
        emailController: TextEditingController(),
      ));
      showFormRegister.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isNextDisabled = false;
    for (var element in parentRegisterInfoListIDListSelected) {
      final kidForm = parentRegisterInfoList.firstWhere((e) => e.id == element);
      if (kidForm.fullNameController.text.isEmpty &&
          kidForm.contactNoController.text.isEmpty &&
          kidForm.emailController.text.isEmpty &&
          kidForm.parentIdentificationDocument == null) {
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
        if (parentRegisterInfoListIDListSelected.contains(id)) {
          parentRegisterInfoListIDListSelected.remove(id);
        } else {
          parentRegisterInfoListIDListSelected.add(id);
        }
      });
    }

    void onSelectFile({File? newFile, required int id}) {
      setState(() {
        parentRegisterInfoList
            .firstWhere((element) => element.id == id)
            .parentIdentificationDocument = newFile;
      });
    }

    void onPressedNext() {}

    return ReservationDetailPageLayout(
      activeStep: 1,
      title: "Parents’ / Guardians’ Information",
      contents: parentRegisterInfoList.mapIndexed((i, e) {
        final moreThanOne = e.id > 1;
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom:
                      isLast(i, parentRegisterInfoList.length) ? 0 : height10),
              child: ShowSelectFormColumn(
                onTapContainer: () {
                  onTapContainer(i);
                },
                onTick: moreThanOne
                    ? () {
                        onTickContainer(e.id);
                      }
                    : () {},
                isTick: moreThanOne
                    ? parentRegisterInfoListIDListSelected.contains(e.id)
                    : true,
                subtitle: moreThanOne
                    ? 'Parent / Guardian ${e.id} (Optional)'
                    : '*Parent / Guardian 1',
                isVisibleForm: showFormRegister[i],
                formContainer: _parentFormContainer(
                    onSelectFile: (newFile) {
                      onSelectFile(id: e.id, newFile: newFile);
                    },
                    parentRegisterInfo: e),
              ),
            )
          ],
        );
      }).toList(),
      onPressedNext: onPressedNext,
      isNextDisabled: isNextDisabled,
    );
  }
}

PrimaryContainer _parentFormContainer({
  required void Function(File? newFile) onSelectFile,
  required ParentRegisterInfo parentRegisterInfo,
}) {
  return PrimaryContainer(
    padding: EdgeInsets.symmetric(vertical: height08 * 2, horizontal: width20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextlabelWithTextfieldColumn(
          textLabel: '*Full name:',
          focusNode: parentRegisterInfo.fullNameFocus,
          controller: parentRegisterInfo.fullNameController,
        ),
        TextlabelWithTextfieldColumn(
          textLabel: '*Contact no:',
          focusNode: parentRegisterInfo.contactNoFocus,
          controller: parentRegisterInfo.contactNoController,
        ),
        TextlabelWithTextfieldColumn(
          textLabel: '*Email address:',
          focusNode: parentRegisterInfo.emailFocus,
          controller: parentRegisterInfo.emailController,
        ),
        TitleWithUploadFileColumn(
            file: parentRegisterInfo.parentIdentificationDocument,
            title: '*Parent identification document',
            buttonText: 'Change File',
            onSelectFile: onSelectFile),
        SizedBox(
          height: height10 * 5,
        )
      ],
    ),
  );
}
