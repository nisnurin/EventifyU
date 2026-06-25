// Location: lib/features/admin/dashboard/event_model.dart

class EventModel {
  // ✅ REMOVED 'final' - These fields must be mutable so they can be updated by the Edit Screen
  String title;
  String description;
  String location;
  
  // These remain final as they don't change during edit operations
  final String month;
  final String day;
  final String time;
 
  final String fullDate;
 
  final int totalParticipants;
  final String status;
  final int attendance;
  final double attendancePercentage;
 
  final String organizerName;
 
  final String imagePath;
  final double fskmPercentage;
  final double fppPercentage;
  final double acisPercentage;
  final double fphpPercentage;

  EventModel({
    required this.title,
    required this.month,
    required this.day,
    required this.time,
    required this.fullDate,
    required this.location,
    required this.totalParticipants,
    required this.status,
    required this.attendance,
    required this.attendancePercentage,
    required this.organizerName,
    required this.description,
    required this.imagePath,
    required this.fskmPercentage,
    required this.fppPercentage,
    required this.acisPercentage,
    required this.fphpPercentage,
  });
}