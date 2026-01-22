import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Dummy data for notifications
  final List<Map<String, String>> _notifications = List.generate(
    10,
    (index) => {
      'title': 'Notification ${index + 1}',
      'subtitle': 'This is the detail for notification ${index + 1}.',
      'time': '${index * 5} mins ago',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            context.go('/settings');
          },
        ),
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              leading: const Icon(Icons.notifications_active),
              title: Text(notification['title']!),
              subtitle: Text(notification['subtitle']!),
              trailing: Text(
                notification['time']!,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              onTap: () {
                // Handle notification tap
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped on ${notification['title']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
