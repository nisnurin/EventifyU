class EventModel {
  final String title;
  final String ticketId;
  final String month;
  final String day;
  final String time;
  final String fullDate;
  final String location;
  final int totalParticipants;
  final String status;
  final int attendance;
  final double attendancePercentage;
  final String organizerName;
  final String description;
  
  // Added properties for dynamic local assets images and customized faculty percentages
  final String imagePath;
  final double fskmPercentage;
  final double fppPercentage;
  final double acisPercentage;
  final double fphpPercentage;

  EventModel({
    required this.title,
    required this.ticketId,
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