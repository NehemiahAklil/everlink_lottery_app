import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/SignUp.dart';
import 'package:flutter_application_1/presentation/pages/aboutus.dart';
import 'package:flutter_application_1/presentation/pages/home.dart';
import 'package:flutter_application_1/presentation/pages/TicketPage.dart';
import 'package:flutter_application_1/presentation/pages/profilepage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'Login.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 1;

  final _items = [
    SalomonBottomBarItem(icon: const Icon(Icons.home,), title: const Text('Home')),
    SalomonBottomBarItem(icon: const Icon(CupertinoIcons.ticket), title: const Text('Ticket')),
    SalomonBottomBarItem(icon: const Icon(Icons.info), title: const Text('About Us')),
    SalomonBottomBarItem(icon: const Icon(Icons.person), title: const Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => const ProfilePage()),
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