import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_text_styles.dart';
import '../core/custom_button.dart';
import '../core/custom_textfield.dart';
import '../features/user/home/home_screen.dart';
import 'auth_repository.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = TextEditingController();
  bool _isLoading = false;

  void _verifyOtp() async {
    setState(() => _isLoading = true);
    // Tip: Use "1234" to pass the dummy validation
    bool success = await AuthRepository.verifyOtp(_otpController.text);
    setState(() => _isLoading = false);

    if (success && mounted) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false, // Clears the navigation stack
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP code. Try '1234'")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textDark),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Verification", style: AppTextStyles.heading1),
            const SizedBox(height: 8),
            const Text("Enter the 4-digit OTP sent to your email.", style: AppTextStyles.body),
            const SizedBox(height: 40),
            
            CustomTextField(
              hintText: "Enter OTP (Try 1234)",
              prefixIcon: Icons.security,
              controller: _otpController,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),
            
            CustomButton(
              text: "Verify & Proceed",
              isLoading: _isLoading,
              onPressed: _verifyOtp,
            ),
          ],
        ),
      ),
    );
  }
}