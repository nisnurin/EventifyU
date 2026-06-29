import 'package:flutter/material.dart';
import '../../../main.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  State<GeneralSettingsScreen> createState() => _GeneralSettingsScreenState();
}

class _GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  bool notification = true;

  @override
  Widget build(BuildContext context) {
    final appState = MyEventApp.of(context);

    final isDark = appState.isDarkMode;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(
        title: const Text("General Settings"),
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.deepPurple,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              value: appState.isDarkMode,
              activeThumbColor: Colors.deepPurple,
              onChanged: (value) {
                appState.changeTheme(value);
              },
            ),
            const SizedBox(height: 10),

            SwitchListTile(
              title: Text(
                "Notification",
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
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
