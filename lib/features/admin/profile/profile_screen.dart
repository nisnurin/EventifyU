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
            ), // CircleAvatar

            const SizedBox(height: 15),

            const Text(
              "Admin Name",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ), // Text

            const Text(
              "admin@gmail.com",
              style: TextStyle(color: Colors.grey),
            ), // Text

            const SizedBox(height: 30),

            // EDIT PROFILE
            Card(
              color: const Color(0xFF1E1E1E),
              child: ListTile(
                leading: const Icon(Icons.edit, color: Colors.deepPurple),
                title: const Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white),
                ), // Text
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ), // Icon
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminEditProfileScreen(),
                    ), // MaterialPageRoute
                  );
                },
              ), // ListTile
            ), // Card

            // SETTINGS
            Card(
              color: const Color(0xFF1E1E1E),
              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.deepPurple),
                title: const Text(
                  "General Settings",
                  style: TextStyle(color: Colors.white),
                ), // Text
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ), // Icon
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AdminSettingsScreen(),
                    ), // MaterialPageRoute
                  );
                },
              ), // ListTile
            ), // Card

            const SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                ), // LinearGradient
                borderRadius: BorderRadius.circular(15),
              ), // BoxDecoration
              child: const Column(
                children: [
                  Text(
                    "Admin Level",
                    style: TextStyle(color: Colors.white),
                  ), // Text
                  SizedBox(height: 10),
                  Text(
                    "SUPER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ), // TextStyle
                  ), // Text
                ],
              ), // Column
            ), // Container

          ],
        ), // Column
      ), // Padding
    ); // Scaffold
  }
}

// =========================================================================
// OBAT DUMMY: Tambahan Class Sementara Di Bawah Ini Untuk Menghilangkan Error 
// =========================================================================

class AdminEditProfileScreen extends StatelessWidget {
  const AdminEditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text(
          'Halaman Edit Profile (Belum Dibuat)',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('General Settings'),
        backgroundColor: Colors.black,
      ),
      body: const Center(
        child: Text(
          'Halaman Settings (Belum Dibuat)',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}