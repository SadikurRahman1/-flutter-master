import '../../../data/data_sources/country_meta_data_sources.dart';
import 'auth_validation_constants.dart';


class AuthValidator {
  AuthValidator._();

  static String? validateEmail(String? email) {
    final trimmed = email?.trim() ?? '';
    if (trimmed.isEmpty) return "Email cannot be empty.";
    if (!AuthValidationConstants.emailRegExp.hasMatch(trimmed)) {
      return "Invalid email format.";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    final trimmed = password?.trim() ?? '';
    if (trimmed.isEmpty) return "Password cannot be empty.";
    if (trimmed.length < 6) return "Password must be at least 6 characters.";
    if (!AuthValidationConstants.passwordRegExp.hasMatch(trimmed)) {
      return "Password must include letters, numbers, and symbols.";
    }
    return null;
  }

  static String? validatePhone(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "Phone number cannot be empty.";
    }

    final trimmed = input.trim();

    if (!RegExp(r'^[0-9]+$').hasMatch(trimmed)) {
      return "Digits only allowed (no + sign)";
    }

    CountryMeta? matched;
    for (int len = 1; len <= 4 && len <= trimmed.length; len++) {
      final prefix = trimmed.substring(0, len);
      final match = countries.where((c) => c.code == prefix).toList();
      if (match.isNotEmpty) matched = match.first;
    }

    if (matched == null) {
      return "Unknown or unsupported country code.";
    }

    final nsn = trimmed.substring(matched.code.length);

    if (nsn.length < matched.minLength) {
      return "Too short for ${matched.name}. Expected ${matched.minLength}-${matched.maxLength} digits.";
    }

    if (nsn.length > matched.maxLength) {
      return "Too long for ${matched.name}. Expected ${matched.minLength}-${matched.maxLength} digits.";
    }

    return null;
  }

  static String? validateOTP(String? code) {
    final trimmed = code?.trim() ?? '';
    if (trimmed.isEmpty) return "Please enter the OTP.";
    if (!AuthValidationConstants.otpRegExp.hasMatch(trimmed)) {
      return "Enter a valid 4-digit OTP.";
    }
    return null;
  }

  static String? validateName(String? name) {
    final trimmed = name?.trim() ?? '';
    if (trimmed.isEmpty) return "Name cannot be empty.";
    if (!AuthValidationConstants.nameRegExp.hasMatch(trimmed)) {
      return "Each word must start with a capital letter.";
    }
    return null;
  }

  static String? validateAge(String? age) {
    final trimmed = age?.trim() ?? '';
    if (trimmed.isEmpty) return "Age cannot be empty.";
    if (!AuthValidationConstants.ageRegExp.hasMatch(trimmed)) {
      return "Enter a valid age (1–120).";
    }
    return null;
  }

  static String? validateAddress(String? address) {
    final trimmed = address?.trim() ?? '';
    if (trimmed.isEmpty) return "Address cannot be empty.";
    if (!AuthValidationConstants.addressRegExp.hasMatch(trimmed)) {
      return "Enter a valid address (min 5 characters).";
    }
    return null;
  }

  static String? validateIDNumber(String? idNumber) {
    final trimmed = idNumber?.trim() ?? '';
    if (trimmed.isEmpty) return "ID number cannot be empty.";
    if (trimmed.length < 5) return "ID number must be at least 5 characters.";
    return null;
  }

  static String? validateEmailOrPhoneNumber(String? input) {
    final trimmed = input?.trim() ?? '';

    if (trimmed.isEmpty) return "This field cannot be empty.";

    if (AuthValidationConstants.emailRegExp.hasMatch(trimmed)) {
      return null;
    }

    String? phoneError = validatePhone(trimmed);
    if (phoneError == null) {
      return null;
    }

    return "Please enter a valid email or phone number.";
  }

}
