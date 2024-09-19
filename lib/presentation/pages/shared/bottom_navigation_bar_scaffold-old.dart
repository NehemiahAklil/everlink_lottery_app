// import 'package:everlink_lottery_app/presentation/widgets/background.dart'; import 'package:flutter/material.dart'; import 'package:flutter_riverpod/flutter_riverpod.dart'; import 'package:go_router/go_router.dart'; import 'package:solar_icons/solar_icons.dart';
// class BottomNavigationBarScaffold extends ConsumerStatefulWidget {
//   final Widget child;

//   const BottomNavigationBarScaffold({super.key, required this.child});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _BottomNavigationBarScaffoldState();
// }

// class _BottomNavigationBarScaffoldState
//     extends ConsumerState<BottomNavigationBarScaffold> {
//   int currentIndex = 0;
//   void changeTab(int index) {
//     switch (index) {
//       case 0:
//         context.go('/home');
//         break;
//       case 1:
//         context.go('/ticket');
//         break;
//       case 2:
//         context.go('/info');
//         break;
//       default:
//         context.go('/profile');
//         break;
//     }
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: CustomBackground(child: widget.child),
//       bottomNavigationBar: Container(
//         // width: MediaQuery.of(context).size.width * 0.9,
//         margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(50),
//           child: BottomNavigationBar(
//               elevation: 0,
//               type: BottomNavigationBarType.fixed,
//               backgroundColor: Color(0xFF9D926E).withOpacity(0.9),
//               selectedIconTheme: IconThemeData(color: Colors.white),
//               selectedItemColor: Colors.white,
//               showUnselectedLabels: false,
//               showSelectedLabels: false,
//               onTap: changeTab,
//               currentIndex: currentIndex,
//               items: [
//                 BottomNavigationBarItem(
//                     icon: Container(
//                       color: Colors.black,
//                       child: Row(children: [
//                         Icon(SolarIconsBold.home),
//                         SizedBox(width: 10),
//                         Text("Home"),
//                       ]),
//                     ),
//                     label: ""),
//                 BottomNavigationBarItem(
//                     icon: Icon(SolarIconsBold.ticket), label: "Ticket"),
//                 BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
//                 BottomNavigationBarItem(
//                     icon: Icon(SolarIconsBold.user), label: "Profile"),
//               ]),
//         ),
//       ),
//     );
//   }
// }
