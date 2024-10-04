import 'package:everlink_lottery_app/application/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(color: Colors.grey, height: 1);
  }
}

class DrawerPage extends ConsumerStatefulWidget {
  const DrawerPage({super.key});

  @override
  ConsumerState<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends ConsumerState<DrawerPage> {
  static const double drawerWidthFactor = 0.8; // 80% of screen width
  static const Color drawerBackgroundColor = Color(0xFF9D926E);
  static const Color profileHeaderColor = Color(0xFF151206);

  @override
  Widget build(BuildContext context) {
    double drawerWidth = MediaQuery.of(context).size.width * drawerWidthFactor;

    return SizedBox(
      width: drawerWidth,
      child: Drawer(
        backgroundColor: drawerBackgroundColor,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              _buildProfileHeader(),
              const SizedBox(height: 25),
              _buildDrawerItem(
                icon: const Icon(SolarIconsBold.user),
                title: AppLocalizations.of(context)!.profile,
                onTap: () => context.go('/profile'),
              ),
              const LineSeparator(),
              _buildDrawerItem(
                icon: const Icon(SolarIconsBold.home),
                title: AppLocalizations.of(context)!.home,
                onTap: () => context.go('/home'),
              ),
              const LineSeparator(),
              _buildDrawerItem(
                icon: const Icon(SolarIconsBold.ticket),
                title: AppLocalizations.of(context)!.tickets,
                onTap: () => context.go('/ticket'),
              ),
              const LineSeparator(),
              _buildDrawerItem(
                icon: const Icon(SolarIconsBold.infoSquare),
                title: AppLocalizations.of(context)!.aboutus,
                onTap: () => context.go('/info'),
              ),
              const LineSeparator(),
              _buildDrawerItem(
                icon: const Icon(SolarIconsBold.bell),
                title: AppLocalizations.of(context)!.announcement,
                onTap: () => context.go('/winner'),
              ),
              const LineSeparator(),
              _buildDrawerItem(
                icon: const Icon(SolarIconsBold.settings),
                title: AppLocalizations.of(context)!.settings,
                onTap: () => context.go('/settings'),
              ),
              const LineSeparator(),
              _buildDrawerItem(
                icon: const Icon(SolarIconsBold.logout),
                title: AppLocalizations.of(context)!.logout,
                onTap: () => showLogoutDialog(context),
              ),
              const LineSeparator(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      margin: const EdgeInsets.only(top: 50.0),
      width: 170,
      height: 169,
      decoration: const ShapeDecoration(
        color: profileHeaderColor,
        shape: OvalBorder(),
      ),
      child: const Icon(SolarIconsBold.user, size: 80, color: Colors.white),
    );
  }

  Widget _buildDrawerItem({
    required Widget icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: icon,
      title: Text(title, style: const TextStyle(fontSize: 20, color: Colors.black)),
      onTap: onTap,
    );
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.logout),
          content: Text(AppLocalizations.of(context)!.logout_text),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            TextButton(
              onPressed: () {
                ref.read(userNotifierProvider.notifier).clear();
                context.go("/login");
              },
              child: Text(AppLocalizations.of(context)!.logout),
            ),
          ],
        );
      },
    );
  }
}
