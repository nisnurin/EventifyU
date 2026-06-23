import 'package:flutter/material.dart';
import 'event_model.dart';
import 'detail_dashboard.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  // Defined mock data matching the new asset image links and specific faculty proportions
  final List<EventModel> events = [
    EventModel(
      title: 'Pentas Rona Jiwa',
      ticketId: '#8954673009',
      month: 'May',
      day: '20',
      time: '10.00 A.M - 12.00 P.M',
      fullDate: 'May 20, 2024',
      location: 'Dewan Lestari',
      totalParticipants: 100,
      status: 'ONGOING',
      attendance: 30,
      attendancePercentage: 0.3,
      organizerName: 'Persatuan Seni Budaya (PSB)',
      description: 'An annual cultural showcase celebrating traditional and contemporary performing arts, music, and theater.',
      imagePath: 'assets/dashboard/rona_jiwa.png', 
      fskmPercentage: 0.15, 
      fppPercentage: 0.20,  
      acisPercentage: 0.35, 
      fphpPercentage: 0.30, 
    ),
    EventModel(
      title: 'Hari Terbuka Kelab',
      ticketId: '#8954673010',
      month: 'Oct',
      day: '07',
      time: '08.00 P.M - 11.00 P.M',
      fullDate: 'October 07, 2024',
      location: 'Dewan Lestari',
      totalParticipants: 250,
      status: 'UPCOMING',
      attendance: 0,
      attendancePercentage: 0.0,
      organizerName: 'Sekretariat Mahasiswa Fakulti',
      description: 'Discover your passion and enhance your student life experience at our Club Open Day.',
      imagePath: 'assets/dashboard/hari_terbuka.png',
      fskmPercentage: 0.25,
      fppPercentage: 0.25,
      acisPercentage: 0.25,
      fphpPercentage: 0.25,
    ),
    EventModel(
      title: 'EventifyU Tech Summit 2026',
      ticketId: '#8954673011',
      month: 'Jul',
      day: '15',
      time: '09.00 A.M - 04.00 P.M',
      fullDate: 'July 15, 2026',
      location: 'Dewan Lestari',
      totalParticipants: 500,
      status: 'UPCOMING',
      attendance: 0,
      attendancePercentage: 0.0,
      organizerName: 'Google Developer Student Clubs',
      description: 'The ultimate congregation of technology enthusiasts, developers, and industry leaders.',
      imagePath: 'assets/dashboard/tech_summit.png',
      fskmPercentage: 0.50, // Higher tech faculty engagement
      fppPercentage: 0.10,
      acisPercentage: 0.15,
      fphpPercentage: 0.25,
    ),
    EventModel(
      title: 'Sukan UiTM Terengganu',
      ticketId: '#8954673012',
      month: 'Aug',
      day: '12',
      time: '07.30 A.M - 01.00 P.M',
      fullDate: 'August 12, 2026',
      location: 'UiTM Dungun',
      totalParticipants: 150,
      status: 'UPCOMING',
      attendance: 0,
      attendancePercentage: 0.0,
      organizerName: 'Unit Sukan & Kokurikulum',
      description: 'The grand intra-campus athletic championship bringing together the finest athletes.',
      imagePath: 'assets/dashboard/sukan_uitm.png',
      fskmPercentage: 0.30,
      fppPercentage: 0.15,
      acisPercentage: 0.20,
      fphpPercentage: 0.35,
    ),
    EventModel(
      title: 'Malam Kebudayaan & Kesenian',
      ticketId: '#8954673013',
      month: 'Nov',
      day: '03',
      time: '08.30 P.M - 11.30 P.M',
      fullDate: 'November 03, 2026',
      location: 'Dewan Lestari',
      totalParticipants: 300,
      status: 'COMPLETED',
      attendance: 280,
      attendancePercentage: 0.93,
      organizerName: 'Kelab Warisan & Teater',
      description: 'A premiere cultural evening curated to bridge creative student performance.',
      imagePath: 'assets/dashboard/malam_kebudayaan.png',
      fskmPercentage: 0.20,
      fppPercentage: 0.20,
      acisPercentage: 0.30,
      fphpPercentage: 0.30,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final item = events[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withAlpha(12), blurRadius: 12, offset: const Offset(0, 4))],
            ),
            child: Column(
              children: [
                // Render asset image safely with error fallback handling
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    item.imagePath,
                    height: 130,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    // Safe guard: Fallback placeholder in case asset files are not yet in folders
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 130,
                        color: const Color(0xFFF3E8FF),
                        child: const Center(
                          child: Icon(Icons.image, color: Colors.deepPurple, size: 32),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(color: const Color(0xFFF3F4F6), borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Text(item.month, style: const TextStyle(fontSize: 11, color: Colors.grey, fontWeight: FontWeight.bold)),
                            Text(item.day, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15), maxLines: 1, overflow: TextOverflow.ellipsis),
                            Text('Ticket ID: ${item.ticketId}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple, size: 16),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailDashboardScreen(event: item)),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}