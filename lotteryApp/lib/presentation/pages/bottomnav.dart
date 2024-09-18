import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/SignUp.dart';
import 'package:flutter_application_1/presentation/pages/aboutus.dart';
import 'package:flutter_application_1/presentation/pages/home.dart';
import 'package:flutter_application_1/presentation/pages/TicketPage.dart';
import 'package:flutter_application_1/presentation/pages/profilepage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Login.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 1;


  @override
  Widget build(BuildContext context) {
    final _items = [
      SalomonBottomBarItem(icon:  Icon(Icons.home,), title: Text(AppLocalizations.of(context)!.home)),
      SalomonBottomBarItem(icon: const Icon(CupertinoIcons.ticket), title: Text(AppLocalizations.of(context)!.ticket)),
      SalomonBottomBarItem(icon: const Icon(Icons.info), title: Text(AppLocalizations.of(context)!.aboutus)),
      SalomonBottomBarItem(icon: const Icon(Icons.person), title: Text(AppLocalizations.of(context)!.profile)),
    ];

    return Container(
      child: ClipRRect(
        child: SalomonBottomBar(
          items: _items,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            if (index == 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Homepage()),
              );
            } else if (index == 1) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const TicketPage()),
              );
            } else if (index == 2) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Aboutus()),
              );
            } else if (index == 3) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Profilepage()),
              );
            }
          },
          selectedItemColor: const Color(0xFFD7B58D),
          unselectedItemColor: Colors.white,
          backgroundColor: Colors.black87,
        ),
      ),
    );
  }
}

