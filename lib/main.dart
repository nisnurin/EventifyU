import 'package:flutter/material.dart';
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
      home: const AdminDashboardScreen(), // Admin Dashboard section -
    );
  }
}
