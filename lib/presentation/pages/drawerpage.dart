import 'package:everlink_lottery_app/application/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Line10 extends StatelessWidget {
  const Line10({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 1,
      color: Colors.grey,
    );
  }
}

class DrawerPage extends ConsumerStatefulWidget {
  const DrawerPage({super.key});

  @override
  ConsumerState<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends ConsumerState<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Drawer(
        backgroundColor: const Color(0xFF9D926E),
        child: Container(
          width: MediaQuery.of(context).size.width, // Full width of the screen
          height: MediaQuery.of(context).size.height, // Full height of the screen
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50.0),
                width: 170,
                height: 169,
                decoration: const ShapeDecoration(
                  color: Color(0xFF151206),
                  shape: OvalBorder(),
                ),
                child: const Icon(Icons.person, size: 80, color: Colors.white),
              ),
              const SizedBox(height: 25),
              Text(AppLocalizations.of(context)!.username,
                  style: const TextStyle(fontSize: 25)),
              const SizedBox(height: 40),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                onTap: () {
                  context.go('/profile');
                },
                title: Text(
                  AppLocalizations.of(context)!.profile,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.home,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {
                  context.go('/home');
                },
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.airplane_ticket, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.tickets,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {
                  context.go('/ticket');
                },
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.info, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.aboutus,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {
                  context.go('/info');
                },
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.announcement, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.announcement,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {},
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.settings,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {},
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.logout,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {
                  ref.read(userNotifierProvider.notifier).clear();
                  context.go("/login");
                },
              ),
              const Line10(),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}