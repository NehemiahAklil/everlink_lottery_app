import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class Line10 extends StatelessWidget {
  const Line10({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,
      height: 1,
      color: Colors.grey,
    );
  }
}

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Drawer(
        backgroundColor: const Color(0xFF9D926E),
        child: Container(
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
              Text(AppLocalizations.of(context)!.username, style: TextStyle(fontSize: 25)),
              const SizedBox(height: 40),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.black),
                onTap: () {},
                title: Text(
                  AppLocalizations.of(context)!.profile,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.home, color: Colors.black),
                title:  Text(
                    AppLocalizations.of(context)!.home,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {},
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.airplane_ticket, color: Colors.black),
                title: Text(
                    AppLocalizations.of(context)!.tickets,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {},
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.info, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.aboutus,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {},
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.announcement, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.announcement,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {},
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.settings,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {},
              ),
              const Line10(),
              const SizedBox(height: 15),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.black),
                title: Text(
                  AppLocalizations.of(context)!.logout,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onTap: () {},
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
