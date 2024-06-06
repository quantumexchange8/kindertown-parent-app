String? validateEmail(String? value) {
  // Pattern for email validation
  String pattern =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)*(\.[a-zA-Z]{2,})$';
  RegExp regex = RegExp(pattern);

  if (value == null) {
    return 'Email is required.';
  } else if (value.isEmpty) {
    return 'Email is required.';
  } else if (!regex.hasMatch(value)) {
    return 'Invalid email address.';
  } else {
    return null; // Return null if the input is valid
  }
}

String? validatePassword(String? value) {
  // Pattern for password validation
  String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$';
  RegExp regex = RegExp(pattern);

  if (value == null) {
    return 'Password is required.';
  } else if (value.isEmpty) {
    return 'Password is required.';
  } else if (!regex.hasMatch(value)) {
    return 'Password must contain at least one uppercase letter, one lowercase letter, and one number.';
  } else {
    return null;
  } // Return null if the input is valid
}
