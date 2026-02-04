import 'package:flutter/material.dart';

class SiteScaffold extends StatelessWidget {
  final Widget child;

  const SiteScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ResponsiveNavBar(),
      drawer: const MobileDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  child,
                  const SiteFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResponsiveNavBar extends StatelessWidget implements PreferredSizeWidget {
  const ResponsiveNavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFF222222))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          InkWell(
            onTap: () => Navigator.pushNamed(context, '/'),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Color(0xFF00FF94),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.flash_on, color: Colors.black, size: 20),
                ),
                const SizedBox(width: 12),
                const Text(
                  'MorphPay',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),

          // Desktop Menu
          if (isDesktop)
            Row(
              children: [
                _NavLink(title: 'Home', route: '/'),
                const SizedBox(width: 32),
                _SolutionsDropdown(),
                const SizedBox(width: 32),
                _NavLink(title: 'Docs', route: '/docs'),
                const SizedBox(width: 48),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text('Launch App', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            )
          else
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final String route;

  const _NavLink({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _SolutionsDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      offset: const Offset(0, 40),
      color: const Color(0xFF1A1A1A),
      surfaceTintColor: Colors.transparent,
      child: const Row(
        children: [
          Text(
            'Solutions',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.white),
        ],
      ),
      onSelected: (value) {
        Navigator.pushNamed(context, value);
      },
      itemBuilder: (context) => [
        _buildMenuItem('Gaming', '/solutions/gaming', Icons.sports_esports),
        _buildMenuItem('E-Commerce', '/solutions/ecommerce', Icons.shopping_cart),
        _buildMenuItem('Social', '/solutions/social', Icons.people_alt),
      ],
    );
  }

  PopupMenuItem<String> _buildMenuItem(String title, String route, IconData icon) {
    return PopupMenuItem<String>(
      value: route,
      child: Row(
        children: [
          Icon(icon, size: 18, color: const Color(0xFF00FF94)),
          const SizedBox(width: 12),
          Text(title, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF0A0A0A),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF222222))),
            ),
            child: Center(
              child: Text(
                'MorphPay',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            title: const Text('Home', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, top: 16, bottom: 8),
            child: Text('SOLUTIONS', style: TextStyle(color: Colors.grey, fontSize: 12)),
          ),
          ListTile(
            leading: const Icon(Icons.sports_esports, color: Color(0xFF00FF94)),
            title: const Text('Gaming', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, '/solutions/gaming'),
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart, color: Color(0xFF00FF94)),
            title: const Text('E-Commerce', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, '/solutions/ecommerce'),
          ),
          ListTile(
            leading: const Icon(Icons.people_alt, color: Color(0xFF00FF94)),
            title: const Text('Social', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, '/solutions/social'),
          ),
          const Divider(color: Color(0xFF222222)),
          ListTile(
            title: const Text('Docs', style: TextStyle(color: Colors.white)),
            onTap: () => Navigator.pushNamed(context, '/docs'),
          ),
        ],
      ),
    );
  }
}

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      color: const Color(0xFF000000),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flash_on, color: Color(0xFF00FF94)),
              SizedBox(width: 8),
              Text('MorphPay', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            '© 2024 MorphPay. All rights reserved.',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
