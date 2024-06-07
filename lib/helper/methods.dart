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
