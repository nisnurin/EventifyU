import 'dart:async';

class AuthRepository {
  // Simulate network delay for logging in
  static Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    // Accept a dummy admin login for testing admin dashboard
    if (email == 'admin' && password == 'admin') return true;
    // Basic validation for normal user
    return email.isNotEmpty && password.length >= 6;
  }

  // Simulate network delay for sending OTP
  static Future<bool> register(String name, String id, String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return name.isNotEmpty && id.isNotEmpty && email.isNotEmpty && password.length >= 6;
  }

  // Simulate OTP Verification
  static Future<bool> verifyOtp(String otp) async {
    await Future.delayed(const Duration(seconds: 2));
    return otp == "1234"; // Dummy OTP code for testing
  }
}