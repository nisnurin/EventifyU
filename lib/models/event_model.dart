class EventModel {
  final String id;
  final String title;
  final String category;
  final String dateText;
  final String day;
  final String month;
  final String time;
  final String location;
  final String organizer;
  final String description;
  final String imageUrl;
  final bool isRegistered;
  final bool isPast;
  final String qrData;

  EventModel({
    required this.id,
    required this.title,
    required this.category,
    required this.dateText,
    required this.day,
    required this.month,
    required this.time,
    required this.location,
    required this.organizer,
    required this.description,
    required this.imageUrl,
    required this.isRegistered,
    required this.isPast,
    required this.qrData,
  });

  EventModel copyWith({
    String? id,
    String? title,
    String? category,
    String? dateText,
    String? day,
    String? month,
    String? time,
    String? location,
    String? organizer,
    String? description,
    String? imageUrl,
    bool? isRegistered,
    bool? isPast,
    String? qrData,
  }) {
    return EventModel(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      dateText: dateText ?? this.dateText,
      day: day ?? this.day,
      month: month ?? this.month,
      time: time ?? this.time,
      location: location ?? this.location,
      organizer: organizer ?? this.organizer,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      isRegistered: isRegistered ?? this.isRegistered,
      isPast: isPast ?? this.isPast,
      qrData: qrData ?? this.qrData,
    );
  }
}
