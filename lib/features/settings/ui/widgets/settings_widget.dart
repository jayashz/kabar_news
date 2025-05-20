import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/router/route_path.dart';
import 'package:kabar_news/features/settings/ui/widgets/dialog/show_theme_dialog.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Profile Section
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(Assets.user),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'johndoe@email.com',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Settings Options
          SettingsTile(
            icon: Icons.person,
            title: 'Account',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.notifications,
            title: 'Notifications',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.color_lens,
            title: 'Theme',
            onTap: () => showThemeDialog(context),
          ),
          SettingsTile(
            icon: Icons.lock,
            title: 'Privacy',
            onTap: () {},
          ),
          SettingsTile(
            icon: Icons.help_outline,
            title: 'Help & Support',
            onTap: () {},
          ),
          const Divider(),
          StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                return SettingsTile(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    if (context.mounted &&
                        FirebaseAuth.instance.currentUser == null) {
                      context.go(RoutePath.splash);
                    }
                  },
                  iconColor: Colors.red,
                  textColor: Colors.red,
                );
              }),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? textColor;

  const SettingsTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.blue),
      title: Text(title, style: Theme.of(context).textTheme.headlineSmall!),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
