import 'package:flutter/material.dart';
import '../theme.dart';
import '../constants.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
              "About FundSync",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              AppTexts.companyVision,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),

            Text(
              "Leadership Team",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),

            // CEO Profile Card
            _buildProfileCard(
              context,
              name: "IndraSena Reddy",
              title: "Chief Executive Officer (CEO)",
              imagePath: "assets/images/ceo.jpg",
              description:
                  "IndraSena leads FundSync with a vision to make startup funding accessible and transparent. With 10+ years of experience in fintech innovation, he drives the company’s strategic growth.",
            ),
            const SizedBox(height: 20),

            // CTO Profile Card
            _buildProfileCard(
              context,
              name: "Gaini Karthik",
              title: "Chief Technology Officer (CTO)",
              imagePath: "assets/images/cto.png",
              description:
                  "Karthik heads the technology team, ensuring FundSync’s platform runs with speed, security, and reliability. He’s passionate about building scalable digital ecosystems.",
            ),
            const SizedBox(height: 20),

            // COO Profile Card
            _buildProfileCard(
              context,
              name: "Roshan",
              title: "Chief Operating Officer (COO)",
              imagePath: "assets/images/coo.jpg",
              description:
                  "Roshan manages operations, partnerships, and investor relations. His leadership ensures FundSync maintains strong client satisfaction and compliance.",
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Helper Widget to Build Each Profile Card
  Widget _buildProfileCard(
    BuildContext context, {
    required String name,
    required String title,
    required String imagePath,
    required String description,
  }) {
    return Card(
      color: AppColors.cardColor,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.subtitleColor,
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
 