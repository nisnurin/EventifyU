import 'package:flutter/material.dart';
import '../../../core/app_colors.dart';
import '../../../core/launch_helper.dart';
import '../../../models/event_model.dart';
import '../../../widget/app_bottom_nav.dart';
import '../../../widget/info_tile.dart';
import '../events/detail_registration.dart';
import 'comfirm_register.dart';

class DetailEventScreen extends StatelessWidget {
  static const String routeName = '/detail-event';
  final EventModel event;

  const DetailEventScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final alreadyRegistered = event.isRegistered;

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: alreadyRegistered
          ? const AppBottomNav(currentIndex: 0)
          : null,
      body: Column(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: AppColors.headerGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  Positioned(
                    top: 12,
                    left: 18,
                    child: _roundIconButton(
                      icon: Icons.arrow_back_ios_new,
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  Positioned(
                    top: 12,
                    right: 18,
                    child: _roundIconButton(
                      icon: Icons.share_outlined,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Share clicked')),
                        );
                      },
                    ),
                  ),
                  const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.image_outlined,
                          color: Color(0xFFD8C5FF),
                          size: 28,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Image Placeholder',
                          style: TextStyle(color: Color(0xFFD8C5FF)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -24),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
                decoration: const BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        event.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: AppColors.textDark,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        InfoTile(
                          icon: Icons.access_time,
                          title: 'Time',
                          value: event.time,
                          onTap: () {
                            LaunchHelper.addToCalendar(
                              title: event.title,
                              location: event.location,
                              description: event.description,
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        InfoTile(
                          icon: Icons.calendar_month_outlined,
                          title: 'Date',
                          value: event.dateText,
                          onTap: () {
                            LaunchHelper.addToCalendar(
                              title: event.title,
                              location: event.location,
                              description: event.description,
                            );
                          },
                        ),
                        const SizedBox(width: 8),
                        InfoTile(
                          icon: Icons.location_on_outlined,
                          title: 'Location',
                          value: event.location,
                          onTap: () {
                            LaunchHelper.openMap(event.location);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 42,
                            width: 42,
                            decoration: const BoxDecoration(
                              gradient: AppColors.primaryGradient,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.person_outline,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  event.organizer,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'Organizer',
                                  style: TextStyle(
                                    color: AppColors.textGrey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'About this event:',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      event.description,
                      style: const TextStyle(
                        color: AppColors.textGrey,
                        height: 1.6,
                        fontSize: 14,
                      ),
                    ),
                    const Spacer(),
                    if (!alreadyRegistered)
                      _gradientButton(
                        text: 'Register',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ConfirmRegisterScreen.routeName,
                            arguments: event,
                          );
                        },
                      ),
                    if (alreadyRegistered)
                      _gradientButton(
                        text: 'View Registration',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            DetailRegistrationScreen.routeName,
                            arguments: event,
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _roundIconButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        height: 42,
        width: 42,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Icon(icon, color: AppColors.textDark, size: 18),
      ),
    );
  }

  Widget _gradientButton({required String text, required VoidCallback onTap}) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        height: 54,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
