import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'general_setting_screen.dart';
import 'e_certificate_screen.dart';
import '../notification/notification_screen.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
         actions: [
    IconButton(
      icon: const Icon(Icons.notifications_none),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const NotificationScreen(),
          ),
        );
      },
    ),
  ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Franklin Clinton",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),

            const Text(
              "franklinclinton@gmail.com",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            Card(
              color: const Color(0xFF1E1E1E),
              child: ListTile(
                leading: const Icon(
                  Icons.edit,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );
                },
              ),
            ),

            Card(
              color: const Color(0xFF1E1E1E),
              child: ListTile(
                leading: const Icon(
                  Icons.settings,
                  color: Colors.deepPurple,
                ),
                title: const Text(
                  "General Settings",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const GeneralSettingsScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.purpleAccent
                  ],
                ),
              ),
              child: const Column(
                children: [
                  Text(
                    "Total Merit Points",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "5.25",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize:
                    const Size(double.infinity, 50),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        const ECertificateScreen(),
                  ),
                );
              },
              child: const Text("All E-Certificate"),
            ),
          ],
        ),
      ),
    );
  }
}