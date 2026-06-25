import 'package:flutter/material.dart';

class AdminEditProfileScreen extends StatelessWidget {
  const AdminEditProfileScreen({super.key});

  InputDecoration inputStyle(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: const Color(0xFFF8F9FA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [

              const CircleAvatar(
                radius: 45,
                backgroundColor: Colors.deepPurple,
                child: Icon(Icons.person, color: Colors.white, size: 40),
              ),

              const SizedBox(height: 20),

              TextField(style: const TextStyle(color: Colors.white), decoration: inputStyle("Name")),
              const SizedBox(height: 15),

              TextField(style: const TextStyle(color: Colors.white), decoration: inputStyle("Admin ID")),
              const SizedBox(height: 15),

              TextField(style: const TextStyle(color: Colors.white), decoration: inputStyle("Email")),
              const SizedBox(height: 15),

              TextField(style: const TextStyle(color: Colors.white), decoration: inputStyle("Phone Number")),
              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () {},
                child: const Text("Save Changes"),
              )
            ],
          ),
        ),
      ),
    );
  }
}