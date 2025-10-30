import 'package:flutter/material.dart';

/// ------------------------------------------------------------
/// 🔹 App-wide Constants & Static Values
/// ------------------------------------------------------------
class AppConstants {
  // App metadata
  static const String appName = "FundSync";
  static const String adminEmail = "gainikarthik094@gmail.com";
  static const String companyAddress = "103 Sanjana Apartments, Kandlakoya";
  static const String companyEmail = "roshan.vodnala123@gmail.com";
  static const String companyPhone = "+91 81257 07517";

  // Google Maps Embed URL (replace with your actual location link)
  static const String googleMapUrl =
      "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3803.1684673125455!2d78.48519997493979!3d17.59473328332821!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb8565da7f1b5f%3A0x4ceb1d653ba4becc!2sSanjana%20Waterfront!5e0!3m2!1sen!2sjp!4v1760408425662!5m2!1sen!2sjp";

  // Firebase collections
  static const String contactsCollection = "contacts";
  static const String fundingRequestsCollection = "funding_requests";
  static const String usersCollection = "users";
  static const String notificationsCollection = "notifications";
}

/// ------------------------------------------------------------
/// 🔹 Route Names
/// ------------------------------------------------------------
class AppRoutes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String about = '/about';
  static const String services = '/services';
  static const String notifications = '/notifications';
  static const String contact = '/contact';
  static const String aiTool = '/ai_tool';
  static const String dashboard = '/admin_dashboard';
  static const String reports = '/reports';
}

/// ------------------------------------------------------------
/// 🔹 Icon Set for Bottom Navigation
/// ------------------------------------------------------------
class AppIcons {
  static const IconData home = Icons.home_rounded;
  static const IconData about = Icons.people_alt_rounded;
  static const IconData services = Icons.handshake_rounded;
  static const IconData notifications = Icons.notifications_active_rounded;
  static const IconData contact = Icons.contact_mail_rounded;
  static const IconData ai = Icons.auto_awesome_rounded;
  static const IconData dashboard = Icons.dashboard_rounded;
  static const IconData report = Icons.insert_drive_file_rounded;
}

/// ------------------------------------------------------------
/// 🔹 Static Text Snippets
/// ------------------------------------------------------------
class AppTexts {
  static const String companyMission =
      "At FundSync, our mission is to simplify access to startup funding and micro-loans for emerging entrepreneurs.";

  static const String companyVision =
      "We believe in empowering innovation by connecting ideas with capital through a trusted digital platform.";

  static const String servicesIntro =
      "FundSync provides tailored financial support for startups, including micro-loans, seed funding, and investor connections.";

  static const String aiToolDescription =
      "Use our AI-powered tool to generate creative and professional descriptions for your startup, website, or investor pitch.";
}

/// ------------------------------------------------------------
/// 🔹 Asset Paths
/// ------------------------------------------------------------
class AppAssets {
  static const String logo = "assets/images/app_logo.png";
  static const String placeholder = "assets/images/placeholder.png";
}
