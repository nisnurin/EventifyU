import 'package:flutter/material.dart';
import '../core/app_colors.dart';
import '../core/app_text_styles.dart';
import '../core/custom_button.dart';
import '../core/custom_textfield.dart';
import 'auth_repository.dart';
import 'otp_verification.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleRegister() async {
    setState(() => _isLoading = true);
    bool success = await AuthRepository.register(
      _nameController.text,
      _idController.text,
      _emailController.text,
      _passwordController.text,
    );
    if (!mounted) return;

    setState(() => _isLoading = false);

    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const OtpVerificationScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields correctly")),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Create Account", style: AppTextStyles.heading1),
            const SizedBox(height: 8),
            const Text(
              "Join EventifyU to explore and join events.",
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 40),

            CustomTextField(
              hintText: "Full Name",
              prefixIcon: Icons.person_outline,
              controller: _nameController,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              hintText: "Student ID",
              prefixIcon: Icons.badge_outlined,
              controller: _idController,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              hintText: "Email",
              prefixIcon: Icons.email_outlined,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),

            CustomTextField(
              hintText: "Password",
              prefixIcon: Icons.lock_outline,
              controller: _passwordController,
              isPassword: true,
            ),
            const SizedBox(height: 40),

            CustomButton(
              text: "Sign Up",
              isLoading: _isLoading,
              onPressed: _handleRegister,
            ),
          ],
        ),
      ),
    );
  }
}
