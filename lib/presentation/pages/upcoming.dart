
import 'package:everlink_lottery_app/presentation/pages/bottomnav.dart';
import 'package:everlink_lottery_app/presentation/pages/drawerpage.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:solar_icons/solar_icons.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  final Color softWhite = const Color(0xFFF5F5F5);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isUpcomingSelected = true;

  @override
  Widget build(BuildContext context) {
    final List<FurnitureItem> furnitureItems = [
      FurnitureItem(
          name: AppLocalizations.of(context)!.sofa,
          imagePath: 'assets/images/sofa_golden.jpg',
          price: 100)
    ];

    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const DrawerPage(),
      bottomNavigationBar: const BottomNav(),
      drawer: const Drawer(),
      body: CustomBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              _buildHeader(),
              const SizedBox(height: 20),
              ...furnitureItems
                  .map(
                      (item) => FurnitureCard(item: item, softWhite: softWhite))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(SolarIconsBold.bell,
                      color: Colors.white, size: 36.0),
                  onPressed: () {},
                ),
                const SizedBox(width: 15),
                IconButton(
                  icon: const Icon(SolarIconsOutline.hamburgerMenu,
                      color: Colors.white, size: 36.0),
                  onPressed: () {
                    _scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.go('/ticket');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Color(0xFFD7B58D)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: Text(AppLocalizations.of(context)!.tickets,
                      style: TextStyle(color: softWhite, fontSize: 16)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isUpcomingSelected = true; //
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isUpcomingSelected
                        ? const Color(0xD99D926E)
                        : Colors.transparent,
                    side: const BorderSide(color: Color(0xFFD7B58D)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                  ),
                  child: Text(AppLocalizations.of(context)!.upcomingtickets,
                      style: TextStyle(color: softWhite, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FurnitureItem {
  final String name;
  final String imagePath;
  final double price;

  FurnitureItem(
      {required this.name, required this.imagePath, required this.price});
}

class FurnitureCard extends StatelessWidget {
  final FurnitureItem item;
  final Color softWhite;

  const FurnitureCard({super.key, required this.item, required this.softWhite});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 6.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(
              item.imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                    side: const BorderSide(color: Color(0xFFD7B58D)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    '${AppLocalizations.of(context)!.date} - ${AppLocalizations.of(context)!.july}',
                    style: TextStyle(color: softWhite),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
