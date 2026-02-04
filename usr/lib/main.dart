import 'package:flutter/material.dart';
import 'package:couldai_user_app/widgets/site_scaffold.dart';
import 'package:couldai_user_app/pages/home_page.dart';
import 'package:couldai_user_app/pages/solution_page.dart';
import 'package:couldai_user_app/pages/docs_page.dart';

void main() {
  runApp(const Web3PaymentApp());
}

class Web3PaymentApp extends StatelessWidget {
  const Web3PaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MorphPay - Web3 Payments',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF050505), // Deep black
        primaryColor: const Color(0xFF00FF94), // Neon Green
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00FF94),
          secondary: Color(0xFFFFFFFF),
          surface: Color(0xFF111111),
          onSurface: Colors.white,
        ),
        fontFamily: 'Roboto', // Default, would use custom font in prod
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF050505),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.5,
            color: Colors.white,
            height: 1.1,
          ),
          displayMedium: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.0,
            color: Colors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Color(0xFFB0B0B0),
            height: 1.6,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SiteScaffold(child: HomePage()),
        '/solutions/gaming': (context) => const SiteScaffold(
              child: SolutionPage(
                title: 'Gaming Solutions',
                subtitle: 'Seamless in-game assets and instant settlement.',
                icon: Icons.sports_esports,
                features: [
                  'Zero-gas transactions for players',
                  'Instant NFT minting',
                  'Cross-chain asset bridging'
                ],
              ),
            ),
        '/solutions/ecommerce': (context) => const SiteScaffold(
              child: SolutionPage(
                title: 'E-Commerce',
                subtitle: 'Accept crypto payments with fiat settlement.',
                icon: Icons.shopping_cart,
                features: [
                  'Real-time currency conversion',
                  'Chargeback protection',
                  'Global tax compliance'
                ],
              ),
            ),
        '/solutions/social': (context) => const SiteScaffold(
              child: SolutionPage(
                title: 'SocialFi',
                subtitle: 'Monetize content and community directly.',
                icon: Icons.people_alt,
                features: [
                  'Micro-tipping infrastructure',
                  'Token-gated communities',
                  'Creator royalty enforcement'
                ],
              ),
            ),
        '/docs': (context) => const SiteScaffold(child: DocsPage()),
      },
    );
  }
}
