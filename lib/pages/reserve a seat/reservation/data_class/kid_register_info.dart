// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';

class KidRegisterInfo {
  int id;
  final FocusNode fullNameFocus;
  final FocusNode chineseNameFocus;
  final FocusNode genderFocus;
  final FocusNode dayFocusNode;
  final FocusNode monthFocusNode;
  final FocusNode yearFocusNode;
  final TextEditingController fullNameController;
  final TextEditingController chineseController;
  final TextEditingController dayController;
  final TextEditingController monthController;
  final TextEditingController yearController;
  String? gender;
  String? isMalaysiaCitizen;
  File? file;
  File? childBirthCertificate;
  KidRegisterInfo({
    required this.id,
    required this.fullNameFocus,
    required this.chineseNameFocus,
    required this.genderFocus,
    required this.dayFocusNode,
    required this.monthFocusNode,
    required this.yearFocusNode,
    required this.fullNameController,
    required this.chineseController,
    required this.dayController,
    required this.monthController,
    required this.yearController,
    this.gender,
    this.isMalaysiaCitizen,
    this.file,
    this.childBirthCertificate,
  });
}
