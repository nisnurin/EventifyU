import 'package:flutter/material.dart';

class ECertificateScreen extends StatelessWidget {
  const ECertificateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("E-Certificate"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [

          CertificateCard(
            title: "PERTAS Nova",
            date: "8.00 AM - 12.00 PM",
          ),

          CertificateCard(
            title: "Malam Melankoli",
            date: "8.00 PM - 10.00 PM",
          ),

          CertificateCard(
            title: "Sublime",
            date: "8.00 AM - 5.00 PM",
          ),

          CertificateCard(
            title: "Hari Terbuka Kelab",
            date: "8.00 AM - 5.00 PM",
          ),
        ],
      ),
    );
  }
}

class CertificateCard extends StatelessWidget {

  final String title;
  final String date;

  const CertificateCard({
    super.key,
    required this.title,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1E1E1E),
      child: ListTile(
        leading: const Icon(
          Icons.description,
          color: Colors.deepPurple,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          date,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: const Icon(
          Icons.picture_as_pdf,
          color: Colors.red,
        ),
      ),
    );
  }
}
