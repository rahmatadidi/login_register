class Validator {
  static String? validateEmail(String email) {
    final emailRegex = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(email)) return "Enter a Valid Email";
    return null;
  }
}
