import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
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

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              height: MediaQuery.sizeOf(context).height * 0.085,
              backgroundColor: const Color(0xFF9D926E).withOpacity(0.9),
              surfaceTintColor: Colors.white,
              elevation: 0,
              // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
              // selectedIndex: currentBottomNavbarIndex,
              selectedIndex: currentIndex,
              // indicatorColor: Colors.white,
              destinations: [
                NavigationDestination(
                  selectedIcon: Icon(
                    SolarIconsBold.homeSmile,
                    color: Theme.of(context).primaryColor,
                  ),
                  icon: Icon(
                    SolarIconsOutline.home,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: "Home",
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    SolarIconsBold.book2,
                    color: Theme.of(context).primaryColor,
                  ),
                  icon: Icon(
                    SolarIconsOutline.book,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: "Book",
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    SolarIconsBold.bookmarkOpened,
                    color: Theme.of(context).primaryColor,
                  ),
                  icon: Icon(
                    SolarIconsOutline.bookmark,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: "Bookmark",
                ),
                NavigationDestination(
                  selectedIcon: Icon(
                    SolarIconsBold.questionCircle,
                    color: Theme.of(context).primaryColor,
                  ),
                  icon: Icon(
                    SolarIconsOutline.questionCircle,
                    color: Theme.of(context).primaryColor,
                  ),
                  label: "Question",
                ),
              ],
              onDestinationSelected: (int index) {
                changeTab(index);
                //   ref.read(pageViewController).animateToPage(index,
                //       duration: const Duration(milliseconds: 500),
                //       curve: Curves.easeInOut);
              },
            )));
  }
}
