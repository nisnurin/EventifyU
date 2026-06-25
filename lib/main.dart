import 'package:flutter/material.dart';
import 'features/user/home/home_screen.dart';
import 'features/user/home/comfirm_register.dart';
import 'features/user/events/detail_registration.dart';
import 'features/user/events/my_event_screen.dart';
import 'features/user/profile/profile_screen.dart';
import 'features/user/notification/notification_screen.dart';
import 'models/event_model.dart';
import 'features/admin/dashboard/dashboard_screen.dart';
void main() {
  runApp(const MyEventApp());
}

class MyEventApp extends StatelessWidget {
  const MyEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventifyU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AdminDashboardScreen(),
    );
  }
}
