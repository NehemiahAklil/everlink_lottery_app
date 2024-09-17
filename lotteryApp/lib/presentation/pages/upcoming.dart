import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/DrawerPage.dart';
import 'package:flutter_application_1/presentation/pages/BottomNav.dart';
import 'package:flutter_application_1/presentation/pages/TicketPage.dart';
import 'package:flutter_application_1/presentation/widgets/background.dart';

class Upcoming extends StatefulWidget {
  const Upcoming({super.key});

  @override
  State<Upcoming> createState() => _UpcomingState();
}

class _UpcomingState extends State<Upcoming> {
  final Color softWhite = const Color(0xFFF5F5F5);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // State variable to track if the Upcoming button is selected
  bool isUpcomingSelected = true;


  final List<FurnitureItem> furnitureItems = [
    FurnitureItem(name: 'Sofa', imagePath: 'assets/sofa.jpeg', price: 100)
  ];

  @override
  Widget build(BuildContext context) {
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
              ...furnitureItems.map((item) => FurnitureCard(item: item, softWhite: softWhite)).toList(),
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
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.white, size: 36.0),
                  onPressed: () {
                    // Handle notification icon press
                  },
                ),
                const SizedBox(width: 15),
                IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white, size: 36.0),
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
                    // Navigate to Tickets page
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const TicketPage()),
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Color(0xFFD7B58D)),
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  ),
                  child: Text('Tickets', style: TextStyle(color: softWhite, fontSize: 16)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Upcoming page

                    setState(() {
                      isUpcomingSelected = true; // Mark this button as selected
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isUpcomingSelected ? const Color(0xD99D926E) : Colors.transparent, // Change color when selected
                    side: const BorderSide(color: Color(0xFFD7B58D)),
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  ),
                  child: Text('Upcoming tickets', style: TextStyle(color: softWhite, fontSize: 16)),
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

  FurnitureItem({required this.name, required this.imagePath, required this.price});
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
                  onPressed: () {
                    // Handle "Play Now" button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                    side: const BorderSide(color: Color(0xFFD7B58D)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    'Date - July 21',
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