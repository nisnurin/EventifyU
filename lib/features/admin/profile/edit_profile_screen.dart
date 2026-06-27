import 'package:flutter/material.dart';

class AdminEditProfileScreen extends StatefulWidget {
  final String name;
  final String adminId;
  final String email;
  final String phone;

  const AdminEditProfileScreen({
    super.key,
    required this.name,
    required this.adminId,
    required this.email,
    required this.phone,
  });

  @override
  State<AdminEditProfileScreen> createState() =>
      _AdminEditProfileScreenState();
}

class _AdminEditProfileScreenState
    extends State<AdminEditProfileScreen> {

  late TextEditingController nameController;
  late TextEditingController adminIdController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController(text: widget.name);
    adminIdController = TextEditingController(text: widget.adminId);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
  }

  @override
  void dispose() {
    nameController.dispose();
    adminIdController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  InputDecoration inputStyle(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(

        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.deepPurple,
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("Edit Profile"),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepPurple,
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 45,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: nameController,
              decoration: inputStyle("Name"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: adminIdController,
              decoration: inputStyle("Admin ID"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: emailController,
              keyboardType:
                  TextInputType.emailAddress,
              decoration: inputStyle("Email"),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: phoneController,
              keyboardType:
                  TextInputType.phone,
              decoration:
                  inputStyle("Phone Number"),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.deepPurple,
                ),
                onPressed: () {

                  Navigator.pop(
                    context,
                    {
                      "name": nameController.text,
                      "adminId":
                          adminIdController.text,
                      "email":
                          emailController.text,
                      "phone":
                          phoneController.text,
                    },
                  );
                },
                child: const Text(
                  "Save Changes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}