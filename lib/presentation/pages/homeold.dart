import 'package:everlink_lottery_app/application/user_provider.dart';
import 'package:everlink_lottery_app/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("ON Home");
    String emailName =
        extractBeforeAt(ref.watch(userNotifierProvider)!.email ?? "");

    debugPrint(ref.watch(userNotifierProvider)?.email);
    debugPrint(emailName);
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 36.0,
                    ),
                    onPressed: () {
                      // Handle notification icon press
                    },
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 36.0,
                    ),
                    onPressed: () {
                      // Open the drawer when the menu icon is clicked
                      // if (_scaffoldKey.currentState != null) {
                      //   _scaffoldKey.currentState?.openEndDrawer();
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
          Text("Welcome $emailName"),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the buttons horizontally
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(100, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25), // Make the border circular with a radius of 15
                    ),
                    backgroundColor:
                        Colors.white // Set your desired width and height
                    ),

                onPressed: () {}, // Add your login logic here
                child: const Text(
                  'Tickets',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 20), // Add some space between the buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          25), // Make the border circular with a radius of 15
                    ),
                    backgroundColor:
                        Colors.grey // Set your desired width and height
                    ),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Upcoming()));
                }, // Add your login logic here
                child: const Text(
                  'Upcoming Tickets',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 45,
                ),
                const Text(
                  'Sofa',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.3,
                        fit: BoxFit.cover,
                        image: const AssetImage(
                            'assets/images/sofa_cream_min.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      // left: 10,
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 30),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(0, 160, 151, 151)
                              .withOpacity(0.5),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('play now'),
                            SizedBox(width: 80),
                            Text('100 birr'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text('Dining Table',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/diningTable.png'),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor:
                              const Color.fromARGB(0, 160, 151, 151)
                                  .withOpacity(0.5),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('play now'),
                            SizedBox(width: 80),
                            Text('100 birr'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text('Kitchen Cabinate',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/KitchenCabinet.png'),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor:
                              const Color.fromARGB(0, 160, 151, 151)
                                  .withOpacity(0.5),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('play now'),
                            SizedBox(width: 80),
                            Text('100 birr'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text('Tv Stand',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Stack(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/TvStand.png'),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          backgroundColor:
                              const Color.fromARGB(0, 160, 151, 151)
                                  .withOpacity(0.5),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('play now'),
                            SizedBox(width: 80),
                            Text('100 birr'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [Text("Home Page")],
    //   ),
    // );
  }
}
