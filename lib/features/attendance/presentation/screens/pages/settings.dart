import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../../../core/usecases/role.dart';
import '../../../../../core/theme/theme_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final roleManager = RoleManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildProfileSection(),
            const SizedBox(height: 24),
            // Widget for testing roles
            _buildRoleSwitcher(),
            const SizedBox(height: 24),

            _buildSettingsItem(
              icon: Icons.notifications_none,
              title: "Notifications",
              onTap: () {
                context.go('/notifications');
              },
            ),
            _buildSettingsItem(
              icon: Icons.lock_outline,
              title: "Security",
              onTap: () {
                context.go('/security');
              },
            ),
            _buildSettingsItem(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",
              trailing: ValueListenableBuilder<ThemeMode>(
                valueListenable: ThemeController.instance.themeMode,
                builder: (context, mode, _) {
                  final isDark = mode == ThemeMode.dark;
                  return Switch(
                    value: isDark,
                    onChanged: (v) {
                      ThemeController.instance.setThemeMode(
                        v ? ThemeMode.dark : ThemeMode.light,
                      );
                    },
                  );
                },
              ),
              onTap: () {},
            ),
            _buildSettingsItem(
              icon: Icons.help_outline,
              title: "Help & Support",
              onTap: () {
                context.go('/help_support');
              },
            ),
            const SizedBox(height: 20),
            _buildLogoutButton(context),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: GNav(
          backgroundColor: Theme.of(context).colorScheme.surface,
          color: Colors.grey,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.green.shade600,
          gap: 8,
          padding: const EdgeInsets.all(16),
          selectedIndex: 3,
          onTabChange: (index) {
            if (index == 0) {
              context.go('/home');
            } else if (index == 1) {
              context.go('/history');
            } else if (index == 2) {
              context.go('/timetable');
            }
          },
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.history, text: 'History'),
            GButton(icon: Icons.calendar_today, text: 'Calendar'),
            GButton(icon: Icons.settings, text: 'Settings'),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleSwitcher() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Dev: Switch Role (For Testing)",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRoleButton(UserRole.student, "Student"),
              _buildRoleButton(UserRole.lecturer, "Lecturer"),
              _buildRoleButton(UserRole.admin, "Admin"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRoleButton(UserRole role, String label) {
    bool isSelected = roleManager.currentRole == role;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          roleManager.setRole(role);
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Switched to $label")));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.white,
        foregroundColor: isSelected ? Colors.white : Colors.blue,
        elevation: 0,
        side: const BorderSide(color: Colors.blue),
      ),
      child: Text(label),
    );
  }

  Widget _buildProfileSection() {
    String name = "Student Name";
    String email = "student@university.edu";

    if (roleManager.isLecturer) {
      name = "Dr. Smith";
      email = "smith@university.edu";
    } else if (roleManager.isAdmin) {
      name = "Admin User";
      email = "admin@university.edu";
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.pinkAccent.shade100,
            child: const Icon(Icons.person, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(email, style: const TextStyle(fontSize: 14)),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: Colors.green.shade600,
            ), // Updated color
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.green.shade600), // Updated color
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing:
            trailing ??
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          context.go('/login');
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.red.shade50,
        ),
        child: const Text(
          "Log Out",
          style: TextStyle(
            color: Colors.red,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
