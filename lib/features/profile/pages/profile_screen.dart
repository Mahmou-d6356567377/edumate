import 'package:flutter/material.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text('View Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: const [
          Icon(Icons.more_vert, color: Colors.black)
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            ProfileHeader(),
            SizedBox(height: 20),
            InfoSection(title: 'Personal Information', children: [
              InfoTile(icon: Icons.email, title: 'Email Address', value: 'mohsen@edumate.edu'),
              InfoTile(icon: Icons.phone, title: 'Phone Number', value: '+1 234 567 890'),
            ]),
            SizedBox(height: 20),
            AcademicSection(),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 45,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, size: 14, color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        const Text('Mohamed Mohsen', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 4),
        const Text('ID: #2024-88421', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text('3rd Student', style: TextStyle(color: Colors.green)),
        )
      ],
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const InfoSection({super.key, required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: children),
        )
      ],
    );
  }
}

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const InfoTile({super.key, required this.icon, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue.withOpacity(0.1),
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      subtitle: Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}

class AcademicSection extends StatelessWidget {
  const AcademicSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Academic Information', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        Row(
          children: const [
            Expanded(child: StatCard(title: 'Current GPA', value: '3.8', subtitle: '+0.2 from last sem')),
            SizedBox(width: 10),
            Expanded(child: StatCard(title: 'Credit Hours', value: '120', subtitle: 'Total registered')),
          ],
        )
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title, value, subtitle;

  const StatCard({super.key, required this.title, required this.value, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.green, fontSize: 12)),
        ],
      ),
    );
  }
}

// ================= SETTINGS SCREEN =================
