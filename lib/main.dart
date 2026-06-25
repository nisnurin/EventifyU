import 'package:flutter/material.dart';
import 'features/user/home/home_screen.dart';
import 'features/user/home/detail_event_screen.dart';
import 'features/user/home/comfirm_register.dart';
import 'features/user/events/detail_registration.dart';
import 'features/user/events/my_event_screen.dart';
import 'features/user/profile/profile_screen.dart';
import 'features/user/notification/notification_screen.dart';
import 'models/event_model.dart';

void main() {
  runApp(const MyEventApp());
}

class MyEventApp extends StatelessWidget {
  const MyEventApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UiTM Event Management',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF7F7FB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF7A4DFF),
          primary: const Color(0xFF7A4DFF),
        ),
      ),
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeScreen.routeName:
            return MaterialPageRoute(builder: (_) => const HomeScreen());

          case DetailEventScreen.routeName:
            final event = settings.arguments as EventModel;
            return MaterialPageRoute(
              builder: (_) => DetailEventScreen(event: event),
            );

          case ConfirmRegisterScreen.routeName:
            final event = settings.arguments as EventModel;
            return MaterialPageRoute(
              builder: (_) => ConfirmRegisterScreen(event: event),
            );

          case DetailRegistrationScreen.routeName:
            final event = settings.arguments as EventModel;
            return MaterialPageRoute(
              builder: (_) => DetailRegistrationScreen(event: event),
            );

          case MyEventScreen.routeName:
            return MaterialPageRoute(builder: (_) => const MyEventScreen());

          case ProfileScreen.routeName:
            return MaterialPageRoute(builder: (_) => const ProfileScreen());

          case NotificationScreen.routeName:
            return MaterialPageRoute(
              builder: (_) => const NotificationScreen(),
            );

          default:
            return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      },
    );
  }
}
