class ApiEndpoint {
  ApiEndpoint._internal();

  static const String _baseEndpoint = "https://mucnapi.robinweb.site/api/v1/";

  static String registration = _endpoint("auth/register-with-otp");
  static String registrationVerify = _endpoint("auth/verify-email-with-otp");

  static String login = _endpoint("auth/login");

  static String forgotPasswordEmail = _endpoint("auth/forget-password");
  static String forgotPasswordOtp = _endpoint("auth/forget-password/verify-otp");
  static String forgotPasswordReset = _endpoint("auth/reset-password");

  static String changePassword = _endpoint("auth/change-password");

  static String getMe = _endpoint("users/me");
  static String products = _endpoint("products");
  static String createSupport = _endpoint("");



  static String _endpoint(String endpoint) {
    return "$_baseEndpoint$endpoint";
  }
}
