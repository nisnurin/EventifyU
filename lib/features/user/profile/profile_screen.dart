import 'package:eventifyu/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'general_setting_screen.dart';
import 'e_certificate_screen.dart';
import '../notification/notification_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String name = "Franklin Clinton";
  String email = "franklinclinton@gmail.com";

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.deepPurple,

        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const NotificationScreen(),
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

            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.deepPurple,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),

            const SizedBox(height: 15),

            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),

            Text(
              email,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
              ),
            ),

            const SizedBox(height: 25),

            /// EDIT PROFILE
            Card(
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              child: ListTile(
                leading: const Icon(Icons.edit, color: Colors.deepPurple),
                title: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const EditProfileScreen(),
                    ),
                  );

                  if (result != null) {
                    setState(() {
                      name = result["name"] ?? name;
                      email = result["email"] ?? email;
                    });
                  }
                },
              ),
            ),

            /// GENERAL SETTINGS
            Card(
              color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
              child: ListTile(
                leading: const Icon(Icons.settings, color: Colors.deepPurple),
                title: Text(
                  "General Settings",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward_ios),

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const GeneralSettingsScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            /// MERIT POINTS
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  colors: [Colors.deepPurple, Colors.purpleAccent],
                ),
              ),
              child: const Column(
                children: [
                  Text("Total Merit Points",
                      style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                  Text("5.25",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// E-CERTIFICATE
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.deepPurple,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ECertificateScreen(),
                  ),
                );
              },
              child: const Text("All E-Certificate"),
            ),

            const SizedBox(height: 15),

            /// 🔥 NOTIFICATION TEST BUTTON (ADDED)
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),

              onPressed: () {
                NotificationService.showNotification(
                  title: "Test Notification 🔔",
                  body: "This is a demo notification from Profile Screen",
                );
              },

              child: const Text("Test Notification"),
            ),
          ],
        ),
      ),
    );
  }
}