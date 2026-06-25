import 'package:url_launcher/url_launcher.dart';

class LaunchHelper {
  static Future<void> openMap(String query) async {
    final uri = Uri.parse(
      '[google.com](https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(query)})',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> addToCalendar({
    required String title,
    required String location,
    required String description,
  }) async {
    final uri = Uri.parse(
      '[calendar.google.com](https://calendar.google.com/calendar/render?action=TEMPLATE)'
      '&text=${Uri.encodeComponent(title)}'
      '&location=${Uri.encodeComponent(location)}'
      '&details=${Uri.encodeComponent(description)}',
    );

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
