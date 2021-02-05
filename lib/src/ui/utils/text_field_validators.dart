class TextFieldValidators {
  static String checkPassword(value) {
    if (value.isEmpty) {
      return 'Password can not be empty';
    }
    if (value.length < 5) {
      return 'Password minimun lenght is 6 characters';
    }
    return null;
  }

  static String checkEmail(value) {
    if (value.isEmpty) {
      return 'Email can not be empty';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }
}
