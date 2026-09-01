class ApiConstants {
  static const String apiBaseUrl = 'https://leoclinicnodejs-production.up.railway.app/api/';
  static const String register = 'auth/register';

  static const String login = 'auth/login';
  static const String verifyEmail = 'auth/verify-email';
  static const String logout = 'auth/login';
  static const String refresh = 'auth/refresh';
  static const String resendVerification = 'auth/resend-verification';
  static const String forgotPassword = 'auth/forgot-password';
  static const String verifyResetPasswordToken = 'auth/password-reset/verify';
  static const String resetPassword = 'auth/reset-password';
  static const String me = 'auth/me';

  static const String doctors = 'doctors';
  static const String locations = 'locations';

  static String doctorById(String id) => 'doctors/$id';
  static String doctorAvailableSlots(String id) => 'doctors/$id/available-slots';
  static String locationById(String id) => 'locations/$id';
}