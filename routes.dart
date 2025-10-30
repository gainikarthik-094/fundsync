import 'package:flutter/material.dart';

// Import all your screens
import 'screens/auth/login_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';
import 'screens/services_screen.dart';
import 'screens/notifications_screen.dart';
import 'screens/contact_screen.dart';
import 'screens/ai_tool/ai_tool_screen.dart';
import 'screens/admin/admin_dashboard.dart';
import 'screens/admin/report_history.dart';

import 'constants.dart';

/// ------------------------------------------------------------
/// 🔹 App Route Configuration
/// ------------------------------------------------------------

final Map<String, WidgetBuilder> appRoutes = {
  AppRoutes.login: (context) => const LoginScreen(),
  AppRoutes.signup: (context) => const SignupScreen(),
  AppRoutes.home: (context) => const HomeScreen(),
  AppRoutes.about: (context) => const AboutScreen(),
  AppRoutes.services: (context) => const ServicesScreen(),
  AppRoutes.notifications: (context) => const NotificationsScreen(),
  AppRoutes.contact: (context) => const ContactScreen(),
  AppRoutes.aiTool: (context) => const AIToolScreen(),
  AppRoutes.dashboard: (context) => const AdminDashboard(),
  AppRoutes.reports: (context) => const ReportHistoryScreen(),
};

/// ------------------------------------------------------------
/// 🔹 Route Helper (Optional)
/// ------------------------------------------------------------
/// Use this for smooth transitions if you want custom animations.
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case AppRoutes.signup:
      return MaterialPageRoute(builder: (_) => const SignupScreen());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case AppRoutes.about:
      return MaterialPageRoute(builder: (_) => const AboutScreen());
    case AppRoutes.services:
      return MaterialPageRoute(builder: (_) => const ServicesScreen());
    case AppRoutes.notifications:
      return MaterialPageRoute(builder: (_) => const NotificationsScreen());
    case AppRoutes.contact:
      return MaterialPageRoute(builder: (_) => const ContactScreen());
    case AppRoutes.aiTool:
      return MaterialPageRoute(builder: (_) => const AIToolScreen());
    case AppRoutes.dashboard:
      return MaterialPageRoute(builder: (_) => const AdminDashboard());
    case AppRoutes.reports:
      return MaterialPageRoute(builder: (_) => const ReportHistoryScreen());
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('404 – Page Not Found')),
        ),
      );
  }
}
