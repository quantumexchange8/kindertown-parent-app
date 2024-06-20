import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/data_class/kid_register_info.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/fill_reservation_detail_second_page.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/kids_form_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/reservation_detail_page_layout.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/show_select_form_column.dart';

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
  void dispose() {
    for (var element in kidRegisterInfoList) {
      element.fullNameFocus.dispose();
      element.chineseNameFocus.dispose();
      element.genderFocus.dispose();
      element.dayFocusNode.dispose();
      element.monthFocusNode.dispose();
      element.yearFocusNode.dispose();
    }
    super.dispose();
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
            formContainer: KidsFormContainer(
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
