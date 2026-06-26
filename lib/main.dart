import 'package:flutter/material.dart';
import 'features/user/home/home_screen.dart';
import 'features/user/home/comfirm_register.dart';
import 'features/user/events/detail_registration.dart';
import 'features/user/events/my_event_screen.dart';
import 'features/user/profile/profile_screen.dart';
import 'features/user/notification/notification_screen.dart';
import 'features/admin/dashboard/dashboard_screen.dart';
import 'models/event_model.dart';
import 'service/notification_service.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  runApp(const MyEventApp());
}

class MyEventApp extends StatefulWidget {
  const MyEventApp({super.key});

  static _MyEventAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyEventAppState>()!;
  }

  @override
  State<MyEventApp> createState() => _MyEventAppState();
}

class _MyEventAppState extends State<MyEventApp> {
  bool isDarkMode = false;

  void changeTheme(bool value) {
    setState(() {
      isDarkMode = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EventifyU',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
       primary: Colors.deepPurple,
        ),
      ),

      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: const AdminDashboardScreen(),
    );
  }
}

