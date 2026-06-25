import 'package:flutter/material.dart';

class AdminSettingsScreen extends StatefulWidget {
  const AdminSettingsScreen({super.key});

  @override
  State<AdminSettingsScreen> createState() => _AdminSettingsScreenState();
}

class _AdminSettingsScreenState extends State<AdminSettingsScreen> {

  bool darkMode = true;
  bool notifications = true;
  bool autoApproveEvents = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text("General Settings"),
        backgroundColor: const Color(0xFFF8F9FA),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            SwitchListTile(
              title: const Text("Dark Mode",
                  style: TextStyle(color: Colors.white)),
              value: darkMode,
              activeThumbColor: Colors.deepPurple,
              onChanged: (val) {
                setState(() => darkMode = val);
              },
            ),

            SwitchListTile(
              title: const Text("Notifications",
                  style: TextStyle(color: Colors.white)),
              value: notifications,
              activeThumbColor: Colors.deepPurple,
              onChanged: (val) {
                setState(() => notifications = val);
              },
            ),

            SwitchListTile(
              title: const Text("Auto Approve Events",
                  style: TextStyle(color: Colors.white)),
              value: autoApproveEvents,
              activeThumbColor: Colors.deepPurple,
              onChanged: (val) {
                setState(() => autoApproveEvents = val);
              },
            ),
          ],
        ),
      ),
    );
  }
}