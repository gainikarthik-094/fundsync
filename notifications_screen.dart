import 'package:flutter/material.dart';
import '../theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for UI demonstration
    final List<Map<String, String>> notifications = [
      {
        "title": "New Funding Opportunity!",
        "message":
            "Applications are open for the Startup India Seed Fund program. Apply now!",
        "time": "2 hours ago"
      },
      {
        "title": "Loan Approved",
        "message":
            "Congratulations! Your micro-loan request for ₹50,000 has been approved.",
        "time": "1 day ago"
      },
      {
        "title": "Platform Update",
        "message":
            "FundSync introduces AI-powered pitch deck suggestions. Try it under the AI Tool section.",
        "time": "2 days ago"
      },
      {
        "title": "Investor Match Found",
        "message":
            "An investor has shown interest in your startup idea. Check your inbox for details.",
        "time": "3 days ago"
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Latest Notifications",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return _buildNotificationCard(
                    context,
                    title: notification["title"]!,
                    message: notification["message"]!,
                    time: notification["time"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context, {
    required String title,
    required String message,
    required String time,
  }) {
    return Card(
      color: AppColors.cardColor,
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(
            Icons.notifications_active_rounded,
            color: AppColors.primaryColor,
            size: 36,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),
              Text(
                message,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                time,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.subtitleColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
