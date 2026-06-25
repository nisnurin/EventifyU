import 'package:flutter/material.dart';


class NotificationScreen extends StatelessWidget {
 
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Notification",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "1 NEW",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const Text(
            "TODAY",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 15),

          buildNotificationCard(
            title: "Event Booked Successfully",
            message:
                "You have successfully registered for Pentas Rona Jiwa.",
            time: "11:31 AM",
            unread: false,
          ),

          buildNotificationCard(
            title: "3 More Days Until WINC 99 Starts!",
            message:
                "Reminder: Your event will begin in 3 days.",
            time: "9:30 AM",
            unread: true,
          ),

          buildNotificationCard(
            title: "Event Review Request",
            message:
                "Please leave your feedback for the event.",
            time: "7:45 AM",
            unread: false,
          ),

          const SizedBox(height: 25),

          const Text(
            "YESTERDAY",
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 15),

          buildNotificationCard(
            title: "Event Review Request",
            message:
                "Tell us about your event experience.",
            time: "4:43 AM",
            unread: false,
          ),

          buildNotificationCard(
            title: "Event Booked Successfully",
            message:
                "Registration completed successfully.",
            time: "10:50 AM",
            unread: false,
          ),
        ],
      ),
    );
  }

  Widget buildNotificationCard({
    required String title,
    required String message,
    required String time,
    required bool unread,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: unread
            ? const Color(0xFF2B1E45)
            : const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CircleAvatar(
            backgroundColor: Colors.deepPurple.withValues(alpha: 0.2),
            child: const Icon(
              Icons.notifications_none,
              color: Colors.deepPurpleAccent,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  message,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          if (unread)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.deepPurpleAccent,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
