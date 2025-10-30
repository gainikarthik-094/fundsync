import 'package:flutter/material.dart';
import '../../theme.dart';
import '../../constants.dart';

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dashboardItems = [
      {
        "title": "Total Users",
        "count": "1,245",
        "icon": Icons.people_rounded,
        "color": Colors.indigo,
      },
      {
        "title": "Funding Requests",
        "count": "382",
        "icon": Icons.request_page_rounded,
        "color": Colors.teal,
      },
      {
        "title": "Active Loans",
        "count": "215",
        "icon": Icons.trending_up_rounded,
        "color": Colors.orange,
      },
      {
        "title": "Reports Generated",
        "count": "54",
        "icon": Icons.insert_drive_file_rounded,
        "color": Colors.purple,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Overview",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(height: 20),

            // Dashboard Summary Cards
            GridView.builder(
              itemCount: dashboardItems.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                final item = dashboardItems[index];
                return _buildDashboardCard(
                  title: item["title"],
                  count: item["count"],
                  icon: item["icon"],
                  color: item["color"],
                );
              },
            ),
            const SizedBox(height: 30),

            // Quick Actions Section
            Text(
              "Quick Actions",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(height: 16),
            _buildActionButton(
              context,
              label: "View Reports",
              icon: Icons.analytics_rounded,
              route: AppRoutes.reports,
            ),
            const SizedBox(height: 12),
            _buildActionButton(
              context,
              label: "Manage Users",
              icon: Icons.manage_accounts_rounded,
              route: AppRoutes.home, // Replace with admin user management later
            ),
            const SizedBox(height: 12),
            _buildActionButton(
              context,
              label: "Review Funding Requests",
              icon: Icons.verified_user_rounded,
              route: AppRoutes.services, // placeholder for future module
            ),
          ],
        ),
      ),
    );
  }

  /// 📊 Dashboard Summary Card
  Widget _buildDashboardCard({
    required String title,
    required String count,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              radius: 28,
              child: Icon(icon, color: color, size: 32),
            ),
            const SizedBox(height: 12),
            Text(
              count,
              style: TextStyle(
                color: color,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ⚙️ Quick Action Button
  Widget _buildActionButton(BuildContext context,
      {required String label, required IconData icon, required String route}) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(label),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }
}
