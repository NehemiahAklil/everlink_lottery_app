import 'package:everlink_lottery_app/presentation/pages/shared/bottom_navigation.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';

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
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/ticket');
        break;
      case 2:
        context.go('/info');
        break;
      default:
        context.go('/profile');
        break;
    }
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: CustomBackground(child: widget.child),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
