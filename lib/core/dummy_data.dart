import '../models/event_model.dart';
import '../models/user_model.dart';

class DummyData {
  static const UserModel currentUser = UserModel(
    name: 'Franklin Clinton',
    phone: '013-6390992',
    faculty: 'FSKM',
    studentId: '2024643144',
  );

  static List<EventModel> events = [
    EventModel(
      id: '1',
      title: 'Pentas Rona Jiwa',
      category: 'Music',
      dateText: '20 May 2026',
      day: '20',
      month: 'May',
      time: '8.00 AM - 5.00 PM',
      location: 'Dewan Lestari',
      organizer: 'Jawatankuasa Program Seni',
      description:
          'An arts and music event featuring student performances, live showcases, and creative presentations from UiTM participants.',
      imageUrl: '',
      isRegistered: false,
      isPast: false,
      qrData: 'event-1-registration-qr',
    ),
    EventModel(
      id: '2',
      title: 'Malam Melankoli',
      category: 'Music',
      dateText: '25 Jun 2026',
      day: '25',
      month: 'Jun',
      time: '8.30 PM - 11.00 PM',
      location: 'Dewan Lestari',
      organizer: 'Kelab Muzik UiTM',
      description:
          'A night event filled with performances, poetry, and acoustic sessions for students who enjoy a calm and emotional musical atmosphere.',
      imageUrl: '',
      isRegistered: false,
      isPast: false,
      qrData: 'event-2-registration-qr',
    ),
    EventModel(
      id: '3',
      title: 'SUiTE 2026',
      category: 'Sports',
      dateText: '20 May 2026',
      day: '20',
      month: 'May',
      time: '8.00 AM - 5.00 PM',
      location: 'UiTM Dungun',
      organizer: 'Jawatankuasa Sukan Pelajar',
      description:
          'Sukan antara UiTM Terengganu. Sukan ini merupakan perlawanan sukan antara fakulti di seluruh UiTM Terengganu. Setiap peserta bertanding untuk fakulti masing-masing.',
      imageUrl: '',
      isRegistered: true,
      isPast: false,
      qrData: 'suite-2026-qr-attendance',
    ),
    EventModel(
      id: '4',
      title: 'Hari Terbuka Kelab',
      category: 'Festival',
      dateText: '27 Jun 2026',
      day: '27',
      month: 'Jun',
      time: '9.00 AM - 4.00 PM',
      location: 'UiTM Dungun',
      organizer: 'Majlis Perwakilan Pelajar',
      description:
          'An open day for students to explore campus clubs, societies, and activities with booths, registration desks, and demos.',
      imageUrl: '',
      isRegistered: false,
      isPast: false,
      qrData: 'event-4-registration-qr',
    ),
    EventModel(
      id: '5',
      title: 'Synchronize Fest 2024',
      category: 'Festival',
      dateText: '20 May 2024',
      day: '20',
      month: 'May',
      time: '10.00 AM - 10.00 PM',
      location: 'UiTM Dungun',
      organizer: 'Student Affairs Division',
      description:
          'A previous large-scale festival event with performances, activities, and student community booths.',
      imageUrl: '',
      isRegistered: true,
      isPast: true,
      qrData: 'sync-fest-2024-qr',
    ),
    EventModel(
      id: '6',
      title: 'WJNC #9 : Gatotkaca Wirajaya 2024',
      category: 'Sports',
      dateText: '7 Oct 2024',
      day: '7',
      month: 'Oct',
      time: '8.00 AM - 6.00 PM',
      location: 'Kompleks Sukan UiTM',
      organizer: 'Sports Unit',
      description:
          'A sports championship event involving student competitors and faculty teams.',
      imageUrl: '',
      isRegistered: true,
      isPast: true,
      qrData: 'wjnc-9-2024-qr',
    ),
  ];

  static List<String> categories = [
    'All',
    'Music',
    'Sports',
    'Festival',
    'Food',
    'Workshop',
  ];
}
