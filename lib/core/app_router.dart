import 'package:edutrack_mut/features/attendance/presentation/screens/pages/help.dart';
import 'package:edutrack_mut/features/attendance/presentation/screens/pages/notifications.dart';
import 'package:edutrack_mut/features/attendance/presentation/screens/pages/security.dart';
import 'package:go_router/go_router.dart';
import '../../features/attendance/presentation/screens/auth/login.dart';
import '../../features/attendance/presentation/screens/auth/signup.dart';
import '../features/attendance/presentation/screens/pages/home_page.dart';
import '../features/attendance/presentation/screens/pages/history.dart';
import '../features/attendance/presentation/screens/pages/timetable.dart';
import '../features/attendance/presentation/screens/pages/settings.dart';
import '../features/attendance/presentation/screens/pages/qr_scan.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(path: '/signup', builder: (context, state) => const SignupPage()),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    GoRoute(path: '/history', builder: (context, state) => const HistoryPage()),
    GoRoute(
      path: '/timetable',
      builder: (context, state) => const TimeTablePage(),
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(path: '/qr_scan', builder: (context, state) => const QRScanPage()),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationsPage(),
    ),
    GoRoute(
      path: '/security',
      builder: (context, state) => const SecurityPage(),
    ),
    GoRoute(
      path: '/help_support',
      builder: (context, state) => const HelpAndSupportPage(),
    ),
  ],
);
