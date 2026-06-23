import 'package:flutter/material.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  State<GeneralSettingsScreen> createState() =>
      _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState
    extends State<GeneralSettingsScreen> {

  bool darkMode = true;
  bool notification = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("General Settings"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            SwitchListTile(
              title: const Text(
                "Dark Mode",
                style: TextStyle(color: Colors.white),
              ),
              value: darkMode,
              activeThumbColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),

            SwitchListTile(
              title: const Text(
                "Notification",
                style: TextStyle(color: Colors.white),
              ),
              value: notification,
              activeThumbColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() {
                  notification = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}