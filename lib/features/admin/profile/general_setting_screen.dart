import 'package:flutter/material.dart';
import '../../../main.dart';

class AdminSettingsScreen extends StatefulWidget {
  const AdminSettingsScreen({super.key});

  @override
  State<AdminSettingsScreen> createState() => _AdminSettingsScreenState();
}

class _AdminSettingsScreenState extends State<AdminSettingsScreen> {
  
  bool notifications = true;
  bool autoApproveEvents = false;

  @override
  Widget build(BuildContext context) {
    final appState = MyEventApp.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("General Settings"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// DARK MODE
            SwitchListTile(
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              value: appState.isDarkMode,
              activeThumbColor: Colors.deepPurple,
              onChanged: (value) {
                appState.changeTheme(value);
              },
            ),

            /// NOTIFICATIONS
            SwitchListTile(
              title: Text(
                "Notifications",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              value: notifications,
              activeThumbColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),

            /// AUTO APPROVE EVENTS
            SwitchListTile(
              title: Text(
                "Auto Approve Events",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              value: autoApproveEvents,
              activeThumbColor: Colors.deepPurple,
              onChanged: (value) {
                setState(() {
                  autoApproveEvents = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}