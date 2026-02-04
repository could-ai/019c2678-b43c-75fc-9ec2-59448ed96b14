import 'package:flutter/material.dart';

class DocsPage extends StatelessWidget {
  const DocsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sidebar (Desktop only)
          if (MediaQuery.of(context).size.width > 800)
            SizedBox(
              width: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Documentation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 24),
                  _SidebarItem('Introduction', isActive: true),
                  _SidebarItem('Quick Start'),
                  _SidebarItem('Core Concepts'),
                  _SidebarItem('Smart Contracts'),
                  _SidebarItem('API Reference'),
                  _SidebarItem('Tutorials'),
                ],
              ),
            ),
          
          // Main Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width > 800 ? 48 : 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Introduction to MorphPay',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'MorphPay is a layer-2 scaling solution for Ethereum that focuses on consumer applications. By utilizing optimistic zkEVM technology, we provide the security of Zero-Knowledge proofs with the developer experience of Optimistic Rollups.',
                    style: TextStyle(fontSize: 18, height: 1.6, color: Color(0xFFCCCCCC)),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Why MorphPay?',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'We solve the "Consumer Trilemma": Scalability, Security, and User Experience. Most blockchains sacrifice one for the others. MorphPay balances all three using a hybrid architecture.',
                    style: TextStyle(fontSize: 16, height: 1.6, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1A1A1A),
                      border: Border(left: BorderSide(color: const Color(0xFF00FF94), width: 4)),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Note',
                          style: TextStyle(color: Color(0xFF00FF94), fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'The testnet is currently live. Mainnet launch is scheduled for Q4 2024.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final String title;
  final bool isActive;

  const _SidebarItem(this.title, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          color: isActive ? const Color(0xFF00FF94) : Colors.grey,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
