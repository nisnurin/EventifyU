import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/dummy_data.dart';
import '../../../models/event_model.dart';
import '../../../widget/app_bottom_nav.dart';
import '../../../widget/event_card.dart';
import '../home/detail_event_screen.dart';

class MyEventScreen extends StatefulWidget {
  static const String routeName = '/my-event';

  const MyEventScreen({super.key});

  @override
  State<MyEventScreen> createState() => _MyEventScreenState();
}

class _MyEventScreenState extends State<MyEventScreen> {
  bool showActive = true;

  List<EventModel> get registeredEvents =>
      DummyData.events.where((e) => e.isRegistered).toList();

  @override
  Widget build(BuildContext context) {
    final events = registeredEvents.where((event) {
      if (showActive) return !event.isPast;
      return event.isPast;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const AppBottomNav(currentIndex: 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Event',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0F7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: _tabButton(
                        label: 'Active Event',
                        selected: showActive,
                        onTap: () {
                          setState(() {
                            showActive = true;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _tabButton(
                        label: 'Past Event',
                        selected: !showActive,
                        onTap: () {
                          setState(() {
                            showActive = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return EventCard(
                      event: event,
                      showDateBadge: true,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          DetailEventScreen.routeName,
                          arguments: event,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabButton({
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: selected ? AppColors.primaryGradient : null,
          color: selected ? null : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.textDark,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
