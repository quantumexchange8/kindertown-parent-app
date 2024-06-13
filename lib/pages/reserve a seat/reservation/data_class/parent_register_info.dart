// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ParentRegisterInfo {
  int id;
  FocusNode fullNameFocus;
  FocusNode contactNoFocus;
  FocusNode emailFocus;
  TextEditingController fullNameController;
  TextEditingController contactNoController;
  TextEditingController emailController;
  File? parentIdentificationDocument;
  ParentRegisterInfo({
    required this.id,
    required this.fullNameFocus,
    required this.contactNoFocus,
    required this.emailFocus,
    required this.fullNameController,
    required this.contactNoController,
    required this.emailController,
    this.parentIdentificationDocument,
  });
}
