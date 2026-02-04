import 'package:flutter/material.dart';

class SolutionPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final List<String> features;

  const SolutionPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        _buildContent(context),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF00FF94).withOpacity(0.05),
            const Color(0xFF050505),
          ],
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 64, color: const Color(0xFF00FF94)),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Key Capabilities',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 32),
          ...features.map((feature) => Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: Color(0xFF00FF94)),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        feature,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 60),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: const Color(0xFF111111),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Start building for $title',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Get access to SDKs and API keys immediately.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00FF94),
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Get SDK'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
