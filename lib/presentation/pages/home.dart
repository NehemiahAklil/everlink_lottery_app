// import 'package:everlink_lottery_app/application/user_provider.dart';
// import 'package:everlink_lottery_app/utils/helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:go_router/go_router.dart';
// import 'package:solar_icons/solar_icons.dart';
//
// class HomePage extends ConsumerStatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   ConsumerState<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends ConsumerState<HomePage> {
//   bool isTicketSelected = true;
//   final Color softWhite = const Color(0xFFF5F5F5);
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//     String emailName =
//         extractBeforeAt(ref.watch(userNotifierProvider)?.email ?? "");
//     final List<FurnitureItem> furnitureItems = [
//       FurnitureItem(
//           name: AppLocalizations.of(context)!.sofa,
//           imagePath: 'assets/sofa.jpeg',
//           price: 100),
//       FurnitureItem(
//           name: AppLocalizations.of(context)!.diningtable,
//           imagePath: 'assets/diningtable.jpg',
//           price: 200),
//       FurnitureItem(
//           name: AppLocalizations.of(context)!.kitchencabinet,
//           imagePath: 'assets/kitchencabinet.jpg',
//           price: 300),
//       FurnitureItem(
//           name: AppLocalizations.of(context)!.tvstand,
//           imagePath: 'assets/TvStand.png',
//           price: 150),
//     ];
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const SizedBox(height: 30),
//           Text(
//             "Welcome ${emailName}",
//             textAlign: TextAlign.start,
//             style: Theme.of(context).textTheme.headlineSmall,
//           ),
//           const SizedBox(height: 20),
//           ...furnitureItems
//               .map((item) => FurnitureCard(item: item, softWhite: softWhite))
//               .toList(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return Align(
//       alignment: Alignment.topRight,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 IconButton(
//                   icon: const Icon(SolarIconsBold.bell,
//                       color: Colors.white, size: 36.0),
//                   onPressed: () {},
//                 ),
//                 const SizedBox(width: 15),
//                 IconButton(
//                   icon: const Icon(SolarIconsOutline.hamburgerMenu,
//                       color: Colors.white, size: 36.0),
//                   onPressed: () {
//                     _scaffoldKey.currentState?.openEndDrawer();
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 30),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       isTicketSelected = true;
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: isTicketSelected
//                         ? const Color(0xD99D926E)
//                         : Colors.transparent,
//                     side: const BorderSide(color: Color(0xFFD7B58D)),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 15),
//                   ),
//                   child: Text(AppLocalizations.of(context)!.ticket,
//                       style: TextStyle(color: softWhite, fontSize: 16)),
//                 ),
//                 // const SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.go('/upcoming');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     side: const BorderSide(color: Color(0xFFD7B58D)),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 30, vertical: 15),
//                   ),
//                   child: Text(AppLocalizations.of(context)!.upcomingtickets,
//                       style: TextStyle(color: softWhite, fontSize: 16)),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class FurnitureItem {
//   final String name;
//   final String imagePath;
//   final double price;
//
//   FurnitureItem(
//       {required this.name, required this.imagePath, required this.price});
// }
//
// class FurnitureCard extends StatelessWidget {
//   final FurnitureItem item;
//   final Color softWhite;
//
//   const FurnitureCard({super.key, required this.item, required this.softWhite});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.transparent,
//       margin: const EdgeInsets.all(16),
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       elevation: 6.0,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 200,
//             child: Image.asset(
//               item.imagePath,
//               height: 200,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     item.name,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.push('/ticketnum');
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.transparent,
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 24, vertical: 12),
//                     textStyle: const TextStyle(fontSize: 16),
//                     side: const BorderSide(color: Color(0xFFD7B58D)),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                     elevation: 4,
//                   ),
//                   child: Text(
//                     '${AppLocalizations.of(context)!.playnow} - ${item.price} ${AppLocalizations.of(context)!.birr}',
//                     style: TextStyle(color: softWhite),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
