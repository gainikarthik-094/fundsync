import 'package:flutter/material.dart';
import '../theme.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Our Services",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              "FundSync provides reliable financial solutions for startups and small businesses. Our services are designed to empower entrepreneurs with easy access to funds, guidance, and growth opportunities.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),

            _buildServiceCard(
              context,
              title: "Micro Loans",
              description:
                  "Quick and secure micro loan approvals to meet your short-term business needs. Apply easily with minimal documentation and flexible repayment terms.",
              icon: Icons.account_balance_wallet_rounded,
            ),
            const SizedBox(height: 20),

            _buildServiceCard(
              context,
              title: "Startup Funding",
              description:
                  "We connect you with trusted investors and funding programs tailored for early-stage startups. From seed to series funding, we help you scale confidently.",
              icon: Icons.rocket_launch_rounded,
            ),
            const SizedBox(height: 20),

            _buildServiceCard(
              context,
              title: "AI-based Financial Recommendations",
              description:
                  "Use our AI-powered tool to generate smart funding suggestions, writeups, and personalized startup descriptions for web, pitch, and marketing.",
              icon: Icons.smart_toy_rounded,
            ),
            const SizedBox(height: 20),

            _buildServiceCard(
              context,
              title: "Business Consultation",
              description:
                  "Get expert advice on structuring your financial plans, managing investor relations, and optimizing your funding strategy.",
              icon: Icons.handshake_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context,
      {required String title,
      required String description,
      required IconData icon}) {
    return Card(
      color: AppColors.cardColor,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryColor, size: 40),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
