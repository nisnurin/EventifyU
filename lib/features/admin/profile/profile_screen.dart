import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'general_setting_screen.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const CircleAvatar(
              radius: 45,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 15),

            const Text(
              "Admin Name",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),

            const Text(
              "admin@gmail.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // EDIT PROFILE
            Card(
              color: const Color(0xFF1E1E1E),
              child: ListTile(
                leading: const Icon(Icons.edit, color: Colors.deepPurple),
                title: const Text("Edit Profile",
                    style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminEditProfileScreen(),
                    ),
                  );
                },
              ),
            ),

            // SETTINGS
            Card(
              color: const Color(0xFF1E1E1E),
              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.deepPurple),
                title: const Text("General Settings",
                    style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.arrow_forward_ios,
                    color: Colors.white),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminSettingsScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  Text("Admin Level",
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  Text("SUPER",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}