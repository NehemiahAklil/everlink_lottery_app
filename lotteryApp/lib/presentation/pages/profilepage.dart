import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/Login.dart';
import 'package:flutter_application_1/presentation/pages/home.dart';
import 'package:flutter_application_1/presentation/pages/TicketPage.dart';
import 'package:flutter_application_1/presentation/pages/aboutus.dart';
import 'package:flutter_application_1/presentation/pages/drawerpage.dart';
import 'package:flutter_application_1/presentation/widgets/background.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Line10 extends StatelessWidget {
  const Line10({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 270,
      height: 2,
      color: Colors.grey,
    );
  }
}

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 3;

  final List<SalomonBottomBarItem> _items = [
    SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),
    SalomonBottomBarItem(icon: Icon(Icons.airplane_ticket), title: Text('Ticket')),
    SalomonBottomBarItem(icon: Icon(Icons.info), title: Text('About Us')),
    SalomonBottomBarItem(icon: Icon(Icons.person), title: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    Widget page;
    switch (index) {
      case 0:
        page = Homepage();
        break;
      case 1:
        page = TicketPage();
        break;
      case 2:
        page = Aboutus();
        break;
      case 3:
        page = ProfilePage();
        break;
      default:
        page = Homepage();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: SalomonBottomBar(
          items: _items,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xFF9D926E),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const DrawerPage(),
      bottomNavigationBar: const BottomNav(),
      body: CustomBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications, color: Colors.black, size: 36.0),
                        onPressed: () {
                          // Handle notification icon press
                        },
                      ),
                      const SizedBox(width: 15),
                      IconButton(
                        icon: const Icon(Icons.menu, color: Colors.black, size: 36.0),
                        onPressed: () {
                          _scaffoldKey.currentState?.openEndDrawer();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Image.asset('assets/rectangle.png', width: 560),
                  Positioned(
                    top: 50,
                    left: 150,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      width: 80,
                      height: 79,
                      decoration: const ShapeDecoration(
                        color: Color(0xFF151206),
                        shape: OvalBorder(),
                      ),
                      child: const Icon(Icons.person, size: 40, color: Colors.white),
                    ),
                  ),
                  const Positioned(
                    top: 135,
                    left: 250,
                    child: Image(image: AssetImage('assets/Vector.png')),
                  ),
                ],
              ),
              // const SizedBox(height: 20),
              // const Text('User Name'),
            ],
          ),
        ),
      ),
    );
  }
}
