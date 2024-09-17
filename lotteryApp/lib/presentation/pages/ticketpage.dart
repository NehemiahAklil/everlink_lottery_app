import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/BottomNav.dart';
import 'package:flutter_application_1/presentation/pages/DrawerPage.dart';
import 'package:flutter_application_1/presentation/pages/Upcoming.dart';
import 'package:flutter_application_1/presentation/widgets/background.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  bool isTicketSelected = true;
  final Color softWhite = const Color(0xFFF5F5F5);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<FurnitureItem> furnitureItems = [
    FurnitureItem(name: 'Sofa', imagePath: 'assets/sofa.jpeg', price: 100),
    FurnitureItem(name: 'Dining Table', imagePath: 'assets/diningtable.jpg', price: 200),
    FurnitureItem(name: 'Kitchen Cabinet', imagePath: 'assets/kitchencabinet.jpg', price: 300),
    FurnitureItem(name: 'TV Stand', imagePath: 'assets/TvStand.png', price: 150),
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
              const SizedBox(height: 1),
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
                    setState(() {
                      isTicketSelected = true; // Mark this button as selected
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isTicketSelected ? const Color(0xD99D926E) : Colors.transparent,
                    side: const BorderSide(color: Color(0xFFD7B58D)),
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                    // Button color
                  ),
                  child: Text('Tickets', style: TextStyle(color: softWhite,fontSize: 16)),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Upcoming page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Upcoming()), // Replace with your Upcoming page
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Button color
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
      elevation: 6.0, // Increased elevation for a more pronounced shadow
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
                const SizedBox(width: 8), // Added spacing between text and button
                ElevatedButton(
                  onPressed: () {
                    // Handle "Play Now" button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent, // Transparent background
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                    side: const BorderSide(color: Color(0xFFD7B58D)), // Light brown border
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 4, // Moderate elevation for shadow effect
                  ),
                  child: Text(
                    'Play Now - ${item.price} birr',
                    style: TextStyle(color: softWhite), // Use soft white color for text
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