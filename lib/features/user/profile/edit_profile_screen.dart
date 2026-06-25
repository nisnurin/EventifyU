import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [

              CircleAvatar(
                radius: 45,
                backgroundColor: Colors.deepPurple,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 40,
                ),
              ),

              const SizedBox(height: 25),

              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("Full Name"),
              ),

              const SizedBox(height: 15),

              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("Student ID"),
              ),

              const SizedBox(height: 15),

              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("Email"),
              ),

              const SizedBox(height: 15),

              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: inputDecoration("Faculty"),
              ),

              const SizedBox(height: 30),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize:
                      const Size(double.infinity, 50),
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

  InputDecoration inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle:
          const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}