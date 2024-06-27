import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

bool isLast(int currentIndex, int itemLength) {
  return itemLength > 1 ? (itemLength - 1) == currentIndex : true;
}

String? getTownStates(String address) {
  // Regular expression to match the town and state
  RegExp regExp = RegExp(r'\b(\d{5})\s([\w\s]+),\s([\w\s]+)\b');
  Match? match = regExp.firstMatch(address);

  if (match != null) {
    String town = match.group(2)!;
    String state = match.group(3)!;
    String result = '$town, $state';
    return result; // Output: Kajang, Selangor
  } else {
    return null;
  }
}

String getBaseName(String filePath) {
  // Split the path by the directory separator
  List<String> parts = filePath.split('/');

  // Return the last part of the split path
  return parts.last;
}

Future<double> getFileSizeInMB(File file) async {
  // Get the file size in bytes
  int fileSizeInBytes = await file.length();

  // Convert the file size to MB
  return (fileSizeInBytes / (1024 * 1024));
}

Future<File?> loadFileFromAssets(String assetPath) async {
  try {
    // Load the PDF file as a byte array from the assets
    final byteData = await rootBundle.load(assetPath);

    // Get the temporary directory
    final tempDir = await getTemporaryDirectory();
    final tempFile = File('${tempDir.path}/${getBaseName(assetPath)}');

    // Write the byte array to the file
    await tempFile.writeAsBytes(byteData.buffer.asUint8List());

    // Set the file path to the state
    return tempFile;
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}

bool isWeekend(DateTime date) {
  // Get the day of the week
  int dayOfWeek = date.weekday;

  // Check if it's Saturday (6) or Sunday (7)
  return dayOfWeek == DateTime.saturday || dayOfWeek == DateTime.sunday;
}
