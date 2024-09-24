import 'package:everlink_lottery_app/presentation/pages/bottomnav.dart';
import 'package:everlink_lottery_app/presentation/pages/drawerpage.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarScaffold extends ConsumerStatefulWidget {
  final Widget child;

  const BottomNavigationBarScaffold({super.key, required this.child});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavigationBarScaffoldState();
}

class _BottomNavigationBarScaffoldState
    extends ConsumerState<BottomNavigationBarScaffold> {
  int currentIndex = 0;
  void changeTab(int index) {
    switch (index) {
      case 1:
        context.pushReplacement('/ticket');
        break;
      case 2:
        context.pushNamed('/info');
        break;
      case 3:
        context.pushNamed('/profile');
        break;
      case 0:
      default:
        context.pushReplacement('/home');
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const DrawerPage(),
      bottomNavigationBar: const BottomNav(),
      drawer: const DrawerPage(),
      extendBody: true,
      body: CustomBackground(child: widget.child),
    );
  }
}
