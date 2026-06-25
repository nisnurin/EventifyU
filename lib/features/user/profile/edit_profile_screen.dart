import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final nameController = TextEditingController();
  final idController = TextEditingController();
  final emailController = TextEditingController();
  final facultyController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    idController.dispose();
    emailController.dispose();
    facultyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: const Color(0xFF1E1E1E),
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [

              const CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFF6200EE),
                child: Icon(Icons.person, color: Colors.white, size: 40),
              ),

              const SizedBox(height: 25),

              TextField(
                controller: nameController,
                decoration: inputDecoration("Full Name"),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: idController,
                decoration: inputDecoration("Student ID"),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: emailController,
                decoration: inputDecoration("Email"),
              ),

              const SizedBox(height: 15),

              TextField(
                controller: facultyController,
                decoration: inputDecoration("Faculty"),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),

                  onPressed: () {
                    Navigator.pop(context, {
                      "name": nameController.text,
                      "id": idController.text,
                      "email": emailController.text,
                      "faculty": facultyController.text,
                    });
                  },

                  child: const Text("Save Changes"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputDecoration inputDecoration(String label) {
  return InputDecoration(
    labelText: label,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}