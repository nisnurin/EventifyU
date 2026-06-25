import 'package:flutter/material.dart';
import 'event_model.dart';
import 'detail_dashboard.dart';
// FIX: Relative path used to step up out of the dashboard folder and into the profile folder
import '../profile/profile_screen.dart'; 

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  int _selectedTab = 0;
  int _currentBottomIndex = 0;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _organizerController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  List<EventModel> events = [
    EventModel(
      title: 'Pentas Rona Jiwa',
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
      imagePath: 'lib/features/assets/dashboard/rona_jiwa.jpg',
      fskmPercentage: 0.15, 
      fppPercentage: 0.20,  
      acisPercentage: 0.35, 
      fphpPercentage: 0.30, 
    ),
    EventModel(
      title: 'Hari Terbuka Kelab',
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
      imagePath: 'lib/features/assets/dashboard/hari_terbuka.jpg',
      fskmPercentage: 0.25,
      fppPercentage: 0.25,
      acisPercentage: 0.25,
      fphpPercentage: 0.25,
    ),
    EventModel(
      title: 'EventifyU Tech Summit 2026',
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
      imagePath: 'lib/features/assets/dashboard/tech_summit.jpg',
      fskmPercentage: 0.50,
      fppPercentage: 0.10,
      acisPercentage: 0.15,
      fphpPercentage: 0.25,
    ),
    EventModel(
      title: 'Sukan UiTM Terengganu',
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
      imagePath: 'lib/features/assets/dashboard/sukan_uitm.jpg',
      fskmPercentage: 0.30,
      fppPercentage: 0.15,
      acisPercentage: 0.20,
      fphpPercentage: 0.35,
    ),
    EventModel(
      title: 'Malam Kebudayaan & Kesenian',
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
      imagePath: 'lib/features/assets/dashboard/malam_kebudayaan.jpg',
      fskmPercentage: 0.20,
      fppPercentage: 0.20,
      acisPercentage: 0.30,
      fphpPercentage: 0.30,
    ),
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _organizerController.dispose();
    _dayController.dispose();
    _monthController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _navigateToDetail(EventModel item, int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailDashboardScreen(event: item),
      ),
    );

    // Safeguard to ensure widget state is still active before rendering context elements
    if (!mounted) return;

    if (result == 'deleted') {
      setState(() {
        events.removeAt(index);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Event successfully deleted.')),
      );
    } else if (result is Map<String, dynamic>) {
      setState(() {
        events[index] = EventModel(
          title: result['title'] ?? item.title,
          month: result['month'] ?? item.month,
          day: result['day'] ?? item.day,
          time: result['time'] ?? item.time,
          fullDate: '${result['month']} ${result['day']}, 2026',
          location: result['location'] ?? item.location,
          totalParticipants: item.totalParticipants,
          status: item.status,
          attendance: item.attendance,
          attendancePercentage: item.attendancePercentage,
          organizerName: item.organizerName,
          description: result['description'] ?? item.description,
          imagePath: result['imagePath'] ?? item.imagePath,
          fskmPercentage: item.fskmPercentage,
          fppPercentage: item.fppPercentage,
          acisPercentage: item.acisPercentage,
          fphpPercentage: item.fphpPercentage,
        );
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Event successfully updated.')),
      );
    } else if (result == 'updated') {
      setState(() {});
    }
  }

  void _showAddEventBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            top: 24,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Create New Event',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 10),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Event Title',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.title, color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _organizerController,
                decoration: InputDecoration(
                  labelText: 'Organizer / Club Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.group, color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _dayController,
                      decoration: InputDecoration(
                        labelText: 'Date (e.g., 25)',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _monthController,
                      decoration: InputDecoration(
                        labelText: 'Month (e.g., Jun)',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location (e.g., Dewan Lestari)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  prefixIcon: const Icon(Icons.location_on, color: Colors.deepPurple),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9333EA),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    if (_titleController.text.isNotEmpty && _dayController.text.isNotEmpty && _monthController.text.isNotEmpty) {
                      setState(() {
                        events.add(
                          EventModel(
                            title: _titleController.text,
                            month: _monthController.text,
                            day: _dayController.text,
                            time: '08.00 A.M - 12.00 P.M',
                            fullDate: '${_monthController.text} ${_dayController.text}, 2026',
                            location: _locationController.text.isEmpty ? 'Dewan Lestari' : _locationController.text,
                            totalParticipants: 0,
                            status: 'UPCOMING',
                            attendance: 0,
                            attendancePercentage: 0.0,
                            organizerName: _organizerController.text.isEmpty ? 'University Secretariat' : _organizerController.text,
                            description: 'No description provided yet.',
                            imagePath: '', 
                            fskmPercentage: 0.25,
                            fppPercentage: 0.25,
                            acisPercentage: 0.25,
                            fphpPercentage: 0.25,
                          ),
                        );
                      });

                      _titleController.clear();
                      _organizerController.clear();
                      _dayController.clear();
                      _monthController.clear();
                      _locationController.clear();

                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'Publish Event',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentBottomIndex,
        children: [
          _buildMainDashboardView(), 
          const AdminProfileScreen(), 
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFE5E7EB), width: 1)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentBottomIndex,
          onTap: (index) {
            setState(() {
              _currentBottomIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF9333EA),
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainDashboardView() {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: _selectedTab == 0 
          ? FloatingActionButton.extended(
              onPressed: () => _showAddEventBottomSheet(context),
              backgroundColor: const Color(0xFF9333EA),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text('Add New Event', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            )
          : null,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTab = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: _selectedTab == 0 ? const Color(0xFF9333EA) : const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: _selectedTab == 0 
                            ? [BoxShadow(color: const Color(0xFF9333EA).withAlpha(60), blurRadius: 8, offset: const Offset(0, 4))]
                            : [],
                      ),
                      child: Center(
                        child: Text(
                          'Events',
                          style: TextStyle(
                            color: _selectedTab == 0 ? Colors.white : Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedTab = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: _selectedTab == 1 ? const Color(0xFF9333EA) : const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: _selectedTab == 1 
                            ? [BoxShadow(color: const Color(0xFF9333EA).withAlpha(60), blurRadius: 8, offset: const Offset(0, 4))]
                            : [],
                      ),
                      child: Center(
                        child: Text(
                          'All Event Analytics',
                          style: TextStyle(
                            color: _selectedTab == 1 ? Colors.white : Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _selectedTab == 0 
                ? _buildEventsList() 
                : _buildAnalyticsDashboard(), 
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 80.0),
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
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: item.imagePath.isNotEmpty
                    ? Image.asset(
                        item.imagePath,
                        height: 130,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        errorBuilder: (context, error, stackTrace) => _buildPlaceholderImage(),
                      )
                    : _buildPlaceholderImage(), 
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
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, color: Colors.deepPurple, size: 16),
                      onPressed: () => _navigateToDetail(item, index), 
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      height: 130,
      width: double.infinity,
      color: const Color(0xFFF3F4F6),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_photo_alternate_outlined, color: Colors.grey, size: 36),
            SizedBox(height: 4),
            Text('No Image Provided Yet', style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildAnalyticsDashboard() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          'Comprehensive Participation Trends',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[800]),
        ),
        const SizedBox(height: 4),
        Text(
          'Data-driven insights to help university management plan future activities.',
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        const SizedBox(height: 16),
        _buildTrendCard(
          title: 'Most Active Month',
          value: 'July & August',
          subtitle: 'Peak performance due to Tech Summit and Campus Sports.',
          icon: Icons.calendar_month,
          iconColor: Colors.blue,
        ),
        const SizedBox(height: 14),
        _buildTrendCard(
          title: 'Highest Category Interest',
          value: 'Technology & Sports',
          subtitle: 'FSKM leads student registration at 50% for tech initiatives.',
          icon: Icons.trending_up,
          iconColor: Colors.green,
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 10, offset: const Offset(0, 2))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.pie_chart, color: Colors.orange, size: 20),
                  SizedBox(width: 8),
                  Text('Average Faculty Engagement', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
              const Divider(height: 24),
              _buildFacultyRow('FSKM (Computer & Math)', '30% Avg Participation'),
              const SizedBox(height: 10),
              _buildFacultyRow('FPP (Business Management)', '18% Avg Participation'),
              const SizedBox(height: 10),
              _buildFacultyRow('ACIS (Islamic Studies)', '25% Avg Participation'),
              const SizedBox(height: 10),
              _buildFacultyRow('FPHP (Hotel & Tourism)', '27% Avg Participation'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTrendCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(8), blurRadius: 10, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: iconColor.withAlpha(30), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: iconColor, size: 26),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold)),
                const SizedBox(height: 2),
                Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1F2937))),
                const SizedBox(height: 2),
                Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFacultyRow(String faculty, String percentage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          faculty, 
          style: TextStyle(
            fontSize: 13, 
            color: Colors.grey[800], 
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(percentage, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.deepPurple)),
      ],
    );
  }
}