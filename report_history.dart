import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../theme.dart';

class ReportHistoryScreen extends StatelessWidget {
  const ReportHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example static data — replace with Firestore or API data later
    final List<Map<String, dynamic>> reports = [
      {
        "title": "Monthly Funding Report - September 2025",
        "amount": "₹12,50,000",
        "status": "Completed",
        "date": "Sep 30, 2025"
      },
      {
        "title": "Quarterly Growth Report - Q2 2025",
        "amount": "₹32,80,000",
        "status": "Completed",
        "date": "Jul 5, 2025"
      },
      {
        "title": "Microloan Activity Report",
        "amount": "₹8,40,000",
        "status": "In Progress",
        "date": "Oct 1, 2025"
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text("Report History"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Analytics Overview",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(height: 20),

            // 📊 Chart Section
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(12),
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: AppColors.primaryColor,
                      spots: const [
                        FlSpot(0, 1.2),
                        FlSpot(1, 2.8),
                        FlSpot(2, 1.8),
                        FlSpot(3, 3.5),
                        FlSpot(4, 2.7),
                        FlSpot(5, 4.0),
                      ],
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: AppColors.primaryColor.withOpacity(0.15),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            Text(
              "Past Reports",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(height: 20),

            // 📄 List of Reports
            ...reports.map((report) {
              return _buildReportCard(
                context,
                title: report["title"],
                amount: report["amount"],
                date: report["date"],
                status: report["status"],
              );
            }),
          ],
        ),
      ),
    );
  }

  /// 📄 Helper Widget: Report Card
  Widget _buildReportCard(BuildContext context,
      {required String title,
      required String amount,
      required String date,
      required String status}) {
    final Color statusColor =
        status == "Completed" ? AppColors.successColor : AppColors.warningColor;

    return Card(
      elevation: 3,
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.15),
          child: Icon(
            Icons.insert_drive_file_rounded,
            color: statusColor,
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            Text(
              "Amount: $amount",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Date: $date",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        trailing: Chip(
          label: Text(
            status,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: statusColor,
        ),
      ),
    );
  }
}
