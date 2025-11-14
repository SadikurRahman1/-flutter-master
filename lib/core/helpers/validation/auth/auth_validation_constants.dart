class AuthValidationConstants {
  AuthValidationConstants._();

  static final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static final RegExp mobileRegExp = RegExp(r'^(?:\+?88)?01[3-9]\d{8}$');

  static final RegExp passwordRegExp = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W_]).{8,}$');

  static final RegExp nameRegExp = RegExp(r'^([A-Z][a-z]+)(\s[A-Z][a-z]+)*$');

  static final RegExp otpRegExp = RegExp(r'^\d{4}$');

  static final RegExp ageRegExp = RegExp(r'^[1-9][0-9]?$|^1[01][0-9]$|^120$');

  static final RegExp addressRegExp = RegExp(r"^[a-zA-Z0-9\s,.'\-/#()]{5,}$");
}
