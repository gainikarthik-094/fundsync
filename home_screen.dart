import 'package:flutter/material.dart';
import '../constants.dart';
import '../theme.dart';
import 'about_screen.dart';
import 'services_screen.dart';
import 'notifications_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = const [
    HomeTab(),
    AboutScreen(),
    ServicesScreen(),
    NotificationsScreen(),
    ContactScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          _getTitle(_selectedIndex),
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(AppIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.about),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.services),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.contact),
            label: 'Contact',
          ),
        ],
      ),
    );
  }

  String _getTitle(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'About Us';
      case 2:
        return 'Our Services';
      case 3:
        return 'Notifications';
      case 4:
        return 'Contact Us';
      default:
        return 'FundSync';
    }
  }
}

/// ------------------------------------------------------------
/// 🔹 Home Tab Content
/// ------------------------------------------------------------
class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome to FundSync!",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: AppColors.primaryColor,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            AppTexts.companyMission,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Our Competitive Advantage",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "🔹 Fast approvals for micro loans\n"
                    "🔹 AI-powered funding recommendations\n"
                    "🔹 Trusted by hundreds of startups\n"
                    "🔹 Secure and transparent process",
                    style: TextStyle(height: 1.6),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.aiTool);
              },
              icon: const Icon(AppIcons.ai),
              label: const Text("Try AI Startup Tool"),
            ),
          ),
        ],
      ),
    );
  }
}
