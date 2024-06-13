import 'dart:io';

bool isLast(int currentIndex, int itemLength) {
  return (itemLength - 1) == currentIndex;
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
