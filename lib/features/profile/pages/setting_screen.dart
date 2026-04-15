import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          SectionTitle('ACCOUNT & APP'),
          SettingsTile(icon: Icons.dark_mode, title: 'Dark Mode', trailing: Switch(value: false, onChanged: null)),
          SettingsTile(icon: Icons.notifications, title: 'Notifications'),
          SettingsTile(icon: Icons.language, title: 'Language', trailingText: 'English'),
          SettingsTile(icon: Icons.lock, title: 'Privacy'),
          SizedBox(height: 20),
          SectionTitle('ABOUT'),
          SettingsTile(icon: Icons.info, title: 'About EduMate'),
          SettingsTile(icon: Icons.system_update, title: 'App Version', trailingText: 'v2.0.4'),
          SettingsTile(icon: Icons.description, title: 'Terms & Conditions'),
          SizedBox(height: 20),
          SectionTitle('SUPPORT'),
          SettingsTile(icon: Icons.help, title: 'Help Center'),
          SettingsTile(icon: Icons.chat, title: 'Contact Support'),
          SettingsTile(icon: Icons.report, title: 'Report a Problem'),
          SizedBox(height: 20),
          LogoutButton(),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(text, style: const TextStyle(color: Colors.grey, fontSize: 12)),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final String? trailingText;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.trailingText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.withOpacity(0.1),
          child: Icon(icon, color: Colors.blue),
        ),
        title: Text(title),
        trailing: trailing ?? (trailingText != null ? Text(trailingText!) : const Icon(Icons.arrow_forward_ios, size: 16)),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
