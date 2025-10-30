import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme.dart';
import '../constants.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  /// Opens email or maps when tapped
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

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
              "Contact Us",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: AppColors.primaryColor,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              "We’d love to hear from you! Reach out for funding inquiries, support, or partnership opportunities.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),

            // 🏢 Company Address
            _buildContactCard(
              context,
              icon: Icons.location_on_rounded,
              title: "Our Address",
              subtitle: AppConstants.companyAddress,
              onTap: () => _launchUrl(AppConstants.googleMapUrl),
            ),
            const SizedBox(height: 20),

            // ☎️ Phone Number
            _buildContactCard(
              context,
              icon: Icons.phone_rounded,
              title: "Phone",
              subtitle: AppConstants.companyPhone,
              onTap: () => _launchUrl("tel:${AppConstants.companyPhone}"),
            ),
            const SizedBox(height: 20),

            // 📧 Email
            _buildContactCard(
              context,
              icon: Icons.email_rounded,
              title: "Email",
              subtitle: AppConstants.companyEmail,
              onTap: () => _launchUrl("mailto:${AppConstants.companyEmail}"),
            ),
            const SizedBox(height: 30),

            // 🌍 Google Maps Embed or External Link
            Text(
              "Our Location",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Center(
                child: TextButton.icon(
                  icon: const Icon(Icons.map_rounded),
                  label: const Text("Open in Google Maps"),
                  onPressed: () => _launchUrl(AppConstants.googleMapUrl),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Footer
            Center(
              child: Text(
                "© ${DateTime.now().year} ${AppConstants.appName}. All Rights Reserved.",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.subtitleColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      color: AppColors.cardColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primaryColor, size: 32),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
        onTap: onTap,
      ),
    );
  }
}
