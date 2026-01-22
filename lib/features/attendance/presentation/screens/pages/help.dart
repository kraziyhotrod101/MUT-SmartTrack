import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go('/settings'); // Navigate back to the Settings page
          },
        ),
        title: const Text("Help & Support"),
        elevation: 0,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Frequently Asked Questions",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildFaqItem(
              context,
              question: "How do I mark my attendance?",
              answer:
                  "To mark your attendance, navigate to the Home screen and tap the 'Scan QR Code' button. Point your camera at the QR code provided by your lecturer for the specific class session.",
            ),
            _buildFaqItem(
              context,
              question: "I can't see my timetable. What should I do?",
              answer:
                  "Please ensure you are logged in and have a stable internet connection. If the issue persists, try logging out and back in. If your timetable is still missing, contact your department's administrative office to ensure you are correctly registered for your modules.",
            ),
            _buildFaqItem(
              context,
              question: "How can I view my attendance history?",
              answer:
                  "You can view your attendance history by tapping on the 'History' tab in the bottom navigation bar. This will show you a record of all the classes you have attended.",
            ),
            const SizedBox(height: 32),
            Text(
              "Contact Support",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildContactItem(
              context,
              icon: Icons.email_outlined,
              title: "Email Support",
              subtitle: "support@mut.ac.za",
              onTap: () {
                // Add functionality to launch email client
              },
            ),
            _buildContactItem(
              context,
              icon: Icons.phone_outlined,
              title: "Call Help Desk",
              subtitle: "+27 (31) 907 7111",
              onTap: () {
                // Add functionality to launch phone dialer
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.bug_report_outlined),
                label: const Text("Report an Issue"),
                onPressed: () {
                  // Navigate to a bug report form or launch an email
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqItem(
    BuildContext context, {
    required String question,
    required String answer,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        childrenPadding: const EdgeInsets.all(16).copyWith(top: 0),
        children: [
          Text(
            answer,
            style: TextStyle(color: Colors.grey.shade700, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}
