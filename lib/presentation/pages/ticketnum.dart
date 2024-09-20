import 'package:flutter/material.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Ticketnumber (),
    );
  }
}

class Ticketnumber extends StatefulWidget {
  @override
  _TicketnumberState createState() => _TicketnumberState();
}

class _TicketnumberState extends State<Ticketnumber > {
  List<int> selectedNumbers = [];
  final int maxSelections = 1;
  List<int> numbers = List.generate(100, (index) => index + 1);
  List<int> filteredNumbers = [];
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    filteredNumbers = numbers;
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void toggleNumber(int number) {
    setState(() {
      if (selectedNumbers.contains(number)) {
        selectedNumbers.remove(number);
      } else {
        selectedNumbers.clear();
        selectedNumbers.add(number);
      }
    });
  }

  void filterNumbers(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredNumbers = numbers;
      });
    } else {
      setState(() {
        filteredNumbers = numbers
            .where((number) => number.toString().contains(query))
            .toList();
      });
    }
  }

  final Color softWhite = const Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: CustomBackground(
          child: Padding(
            padding: const EdgeInsets.only(top: 45.0, left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                      iconSize: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: searchController,
                  focusNode: searchFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Search Number',
                    labelStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Color(0xFFD7B58D)),
                    ),
                    suffixIcon: const Icon(Icons.search, color: Colors.grey),
                  ),
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) => filterNumbers(value),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: selectedNumbers.map((num) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Container(
                      width: 75,
                      height: 65,
                      child: Chip(
                        label: Text(
                          '$num',
                          style: const TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        backgroundColor: softWhite,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Color(0xFFD7B58D)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  )).toList(),
                ),
                // const SizedBox(height: 4),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.only(top: 10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemCount: filteredNumbers.length,
                    itemBuilder: (context, index) {
                      int number = filteredNumbers[index];
                      bool isSelected = selectedNumbers.contains(number);
                      return GestureDetector(
                        onTap: () => toggleNumber(number),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.grey : const Color(0xFF222222).withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xFFD7B58D)),
                          ),
                          child: Center(
                            child: Text(
                              '$number',
                              style: TextStyle(
                                fontSize: 18,
                                color: isSelected ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Color(0xFFD7B58D)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  ),
                  onPressed: () {

                  },
                  child: const Text('Buy Ticket', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}