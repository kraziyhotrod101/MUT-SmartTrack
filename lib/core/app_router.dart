import 'package:go_router/go_router.dart';
import '../../features/attendance/presentation/screens/auth/login.dart';
import '../../features/attendance/presentation/screens/auth/signup.dart';
import '../../features/attendance/presentation/screens/home/home_page.dart';
import '../../features/attendance/presentation/screens/home/history.dart';
import '../../features/attendance/presentation/screens/home/timetable.dart';
import '../../features/attendance/presentation/screens/home/settings.dart';
import '../../features/attendance/presentation/screens/home/qr_scan.dart';

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
    GoRoute(
      path: '/qr_scan',
      builder: (context, state) => const QRScanPage(),
    ),
  ],
);
