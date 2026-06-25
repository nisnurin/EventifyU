
import 'dart:math';
import 'package:flutter/material.dart';
import 'event_model.dart';
import 'edit_event_screen.dart';

class DetailDashboardScreen extends StatefulWidget {
  final EventModel event;
  const DetailDashboardScreen({super.key, required this.event});

  @override
  State<DetailDashboardScreen> createState() => _DetailDashboardScreenState();
}

class _DetailDashboardScreenState extends State<DetailDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('Detail Event', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dynamic Header Banner Image
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                widget.event.imagePath,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    color: const Color(0xFFF3E8FF),
                    child: const Center(
                      child: Icon(Icons.image, color: Colors.deepPurple, size: 40),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.event.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFF6366F1),
                  child: Icon(Icons.person, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.event.organizerName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const Text('Organizer', style: TextStyle(color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Text('About this event:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              widget.event.description,
              style: const TextStyle(color: Colors.black87, height: 1.5, fontSize: 13),
            ),
            const SizedBox(height: 24),
            
            _buildStatTile(Icons.person_outline, 'Total Participant', '${widget.event.totalParticipants}'),
            _buildStatTile(Icons.sync, 'Status Event', widget.event.status),
            _buildStatTile(Icons.analytics_outlined, 'Attendance', '${widget.event.attendance}', progress: widget.event.attendancePercentage),
            
            // Faculty Statistics UI Card mapped directly to selected event percentages
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Faculty Statistics', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 24),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CustomPaint(
                        painter: FigmaPieChartPainter(
                          fskm: widget.event.fskmPercentage,
                          fpp: widget.event.fppPercentage,
                          acis: widget.event.acisPercentage,
                          fphp: widget.event.fphpPercentage,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              height: 56,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF9D59FF), Color(0xFF8533FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
                onPressed: () async {
                  // Await the return signal feedback from EditEventScreen
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditEventScreen(event: widget.event),
                    ),
                  );

                  if (context.mounted) {
                    if (result == 'deleted') {
                      // If deleted, go back down the root stack with the deletion result
                      Navigator.pop(context, 'deleted');
                    } else if (result == 'updated') {
                      // Refresh current UI details view with updated entity properties
                      setState(() {});
                    }
                  }
                },
                child: const Text(
                  'Edit Event',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Bottom padding after the button
          ],
        ),
      ),
    );
  }

  Widget _buildStatTile(IconData icon, String title, String value, {double? progress}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.teal, size: 24),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              ),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              color: Colors.deepPurple,
              minHeight: 6,
            ),
          ]
        ],
      ),
    );
  }
}

class FigmaPieChartPainter extends CustomPainter {
  final double fskm;
  final double fpp;
  final double acis;
  final double fphp;

  FigmaPieChartPainter({required this.fskm, required this.fpp, required this.acis, required this.fphp});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    final paintFPHP = Paint()..color = const Color(0xFFAB22CD); 
    final paintACIS = Paint()..color = const Color(0xFFF802FE); 
    final paintFSKM = Paint()..color = const Color(0xFF3200C0); 
    final paintFPP = Paint()..color = const Color(0xFF8146EC);  

    double sweepFPHP = fphp * 2 * pi;
    double sweepACIS = acis * 2 * pi;
    double sweepFSKM = fskm * 2 * pi;
    double sweepFPP = fpp * 2 * pi;

    double startAngle = 0;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle, sweepFPHP, true, paintFPHP);
    _drawLabel(canvas, center, radius, startAngle, sweepFPHP, '${(fphp * 100).toInt()}%\nFPHP');
    startAngle += sweepFPHP;

    final centerACIS = Offset(center.dx - 3, center.dy + 1);
    canvas.drawArc(Rect.fromCircle(center: centerACIS, radius: radius), startAngle, sweepACIS, true, paintACIS);
    _drawLabel(canvas, centerACIS, radius, startAngle, sweepACIS, '${(acis * 100).toInt()}%\nACIS');
    startAngle += sweepACIS;

    final centerFSKM = Offset(center.dx - 2, center.dy - 4);
    canvas.drawArc(Rect.fromCircle(center: centerFSKM, radius: radius), startAngle, sweepFSKM, true, paintFSKM);
    _drawLabel(canvas, centerFSKM, radius, startAngle, sweepFSKM, '${(fskm * 100).toInt()}%\nFSKM');
    startAngle += sweepFSKM;

    final centerFPP = Offset(center.dx + 4, center.dy - 1);
    canvas.drawArc(Rect.fromCircle(center: centerFPP, radius: radius), startAngle, sweepFPP, true, paintFPP);
    _drawLabel(canvas, centerFPP, radius, startAngle, sweepFPP, '${(fpp * 100).toInt()}%\nFPP');
  }

  void _drawLabel(Canvas canvas, Offset center, double radius, double startAngle, double sweepAngle, String text) {
    final double labelAngle = startAngle + (sweepAngle / 2);
    final double labelRadius = radius * 0.6; 
    final double x = center.dx + labelRadius * cos(labelAngle);
    final double y = center.dy + labelRadius * sin(labelAngle);

    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, height: 1.2),
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout();

    textPainter.paint(canvas, Offset(x - (textPainter.width / 2), y - (textPainter.height / 2)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}