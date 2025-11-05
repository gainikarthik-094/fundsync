import 'package:flutter/material.dart';

void main() {
  runApp(const MicroLoanApp());
}

class MicroLoanApp extends StatelessWidget {
  const MicroLoanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Microloans & Startup Funds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const MainNavigation(),
    );
  }
}

// ================= Main Navigation =================
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _index = 0;

  final List<Widget> _screens = const [
    HomePage(),
    ApplyLoanPage(),
    SupportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.assignment), label: 'Apply'),
          NavigationDestination(icon: Icon(Icons.support_agent), label: 'Support'),
        ],
      ),
    );
  }
}

// ================= Home Page =================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Startup Fund & Microloans')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Available Funding Options',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          FundingCard(
            title: 'Startup Seed Fund',
            desc: 'Up to ₹5,00,000 for new startups. Quick approval.',
          ),
          FundingCard(
            title: 'Women Entrepreneurs Loan',
            desc: 'Exclusive support for women-led startups. 5% interest.',
          ),
          FundingCard(
            title: 'Student Innovator Grant',
            desc: '₹50,000–₹1,00,000 for college-level startup ideas.',
          ),
          FundingCard(
            title: 'Green Energy Startup Loan',
            desc: 'Special low-interest fund for eco-friendly innovations.',
          ),
        ],
      ),
    );
  }
}

class FundingCard extends StatelessWidget {
  final String title;
  final String desc;

  const FundingCard({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}

// ================= Apply Loan Page =================
class ApplyLoanPage extends StatelessWidget {
  const ApplyLoanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Apply for Microloan')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: LoanForm(),
      ),
    );
  }
}

class LoanForm extends StatefulWidget {
  const LoanForm({super.key});

  @override
  State<LoanForm> createState() => _LoanFormState();
}

class _LoanFormState extends State<LoanForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController amountCtrl = TextEditingController();
  final TextEditingController reasonCtrl = TextEditingController();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Application submitted for ₹${amountCtrl.text} by ${nameCtrl.text}',
          ),
        ),
      );
      nameCtrl.clear();
      amountCtrl.clear();
      reasonCtrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: nameCtrl,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                v == null || v.isEmpty ? 'Enter your full name' : null,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: amountCtrl,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Loan Amount (₹)',
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                v == null || v.isEmpty ? 'Enter amount' : null,
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: reasonCtrl,
            decoration: const InputDecoration(
              labelText: 'Purpose / Startup Idea',
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                v == null || v.isEmpty ? 'Enter purpose' : null,
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text('Submit Application'),
              onPressed: submitForm,
            ),
          ),
        ],
      ),
    );
  }
}

// ================= Support Page =================
class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'How can we help you?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Our support team helps startups and entrepreneurs with loan guidance, documentation, and technical queries.',
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.indigo),
            title: const Text('Call Support'),
            subtitle: const Text('+91 81257 07517'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.email, color: Colors.indigo),
            title: const Text('Email Us'),
            subtitle: const Text('support@fundsync.in'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on, color: Colors.indigo),
            title: const Text('Head Office'),
            subtitle:
                const Text('1st Floor, Sanjana water Front, Kandlakoya, Hyderabad'),
          ),
          const SizedBox(height: 20),
          const Text(
            'Our Team',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const ServiceCard(title: 'Roshan Vodnala', desc: 'The Founder of FundSync.'),
          const ServiceCard(title: 'Indrasena Reddy Mukkisa', desc: 'The CEO of FundSync'),
          const ServiceCard(title: 'Gaini Karthik', desc: 'The Technical Support of FundSync'),
          const SizedBox(height: 20),
          const Text(
            'Available Services:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const ServiceCard(title: 'Loan Assistance', desc: 'Get help applying for or tracking your microloan.'),
          const ServiceCard(title: 'Startup Mentoring', desc: 'Free guidance from experts for your startup idea.'),
          const ServiceCard(title: 'Home Visit Support', desc: 'Request an agent to visit your location for help.'),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String desc;

  const ServiceCard({super.key, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.handshake, color: Colors.indigo),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(desc),
      ),
    );
  }
}
