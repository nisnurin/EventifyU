import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'general_setting_screen.dart';

class AdminProfileScreen extends StatefulWidget {
  const AdminProfileScreen({super.key});

  @override
  State<AdminProfileScreen> createState() =>
      _AdminProfileScreenState();
}

class _AdminProfileScreenState
    extends State<AdminProfileScreen> {
  String adminName = "Admin Name";
  String adminId = "ADM001";
  String adminEmail = "admin@gmail.com";
  String adminPhone = "012-3456789";

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text("Profile"),
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
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              adminName,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color:
                    isDark ? Colors.white : Colors.black,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              adminEmail,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              adminPhone,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 30),

            /// EDIT PROFILE
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.edit,
                  color: Colors.deepPurple,
                ),
                title: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                trailing:
                    const Icon(Icons.arrow_forward_ios),
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          AdminEditProfileScreen(
                        name: adminName,
                        adminId: adminId,
                        email: adminEmail,
                        phone: adminPhone,
                      ),
                    ),
                  );

                  if (result != null && mounted) {
                    setState(() {
                      adminName = result["name"];
                      adminId = result["adminId"];
                      adminEmail = result["email"];
                      adminPhone = result["phone"];
                    });
                  }
                },
              ),
            ),

            const SizedBox(height: 15),

            /// GENERAL SETTINGS
            Card(
              child: ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.deepPurple,
                ),
                title: Text(
                  "General Settings",
                  style: TextStyle(
                    color: isDark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                trailing:
                    const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const AdminSettingsScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 35),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.purpleAccent,
                  ],
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                children: [
                  Text(
                    "Admin Level",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "SUPER",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}