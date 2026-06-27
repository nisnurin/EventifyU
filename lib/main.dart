import 'package:flutter/material.dart';
import 'features/admin/dashboard/dashboard_screen.dart';
import 'service/notification_service.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.init();
  runApp(const MyEventApp());
}

class MyEventApp extends StatefulWidget {
  const MyEventApp({super.key});

  static MyEventAppState of(BuildContext context) {
    return context.findAncestorStateOfType<MyEventAppState>()!;
  }

  @override
  State<MyEventApp> createState() => MyEventAppState();
}

class MyEventAppState extends State<MyEventApp> {
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

