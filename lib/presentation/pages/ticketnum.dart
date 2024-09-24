import 'package:everlink_lottery_app/application/entry_ticket_provider.dart';
import 'package:everlink_lottery_app/domain/entity/entry_ticket.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

class TicketNumber extends ConsumerStatefulWidget {
  const TicketNumber(
      {required this.lotteryLimit, required this.lotteryId, super.key});
  final String lotteryId;
  final int lotteryLimit;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TicketNumberState();
}

class _TicketNumberState extends ConsumerState<TicketNumber> {
  List<int> selectedNumbers = [];
  int selectedNumber = 0;
  List<int> numbers = List.generate(100, (index) => index + 1);
  List<int> filteredNumbers = [];
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode();

  // Simulate a logged-in status
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  // Change this to true if user is logged in
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    numbers = List.generate(widget.lotteryLimit, (index) => index + 1);
    isLoggedIn = _firebaseAuth.currentUser != null;

    filteredNumbers = numbers;
  }

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
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
    var selectedEntityTickets =
        ref.watch(selectedEntryTicketsProvider(lotteryId: widget.lotteryId));
    // .when(
    //     data: (selectedValues) {
    //       setState(() {
    //         selectedNumbers = selectedValues
    //             .map((EntryTicket el) => int.parse(el.id))
    //             .toList();
    //       });
    //     },
    //     error: (error, stackTrace) {},
    //     loading: () {});
    return Scaffold(
        body: selectedEntityTickets.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Container(
                  child: Text("Can't seem to get values"),
                ),
            data: (selectedValues) {
              // List<int> selectedNumbers = selectedValues
              //     .map((EntryTicket el) => int.parse(el.id))
              //     .toList();
              if (selectedNumbers.isEmpty) {
                setState(() {
                  selectedNumbers = selectedValues
                      .map((EntryTicket el) => int.parse(el.id))
                      .toList();
                });
              }
              // setState(() {
              //   selectedNumbers = selectedValues
              //       .map((EntryTicket el) => int.parse(el.id))
              //       .toList();
              // });
              return GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: CustomBackground(
                      child: Padding(
                    padding: const EdgeInsets.only(
                        top: 45.0, left: 16, right: 16, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.go('/ticket');
                              },
                              icon: const Icon(Icons.arrow_back_ios_sharp,
                                  color: Colors.white),
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
                              borderSide:
                                  const BorderSide(color: Color(0xFFD7B58D)),
                            ),
                            suffixIcon:
                                const Icon(Icons.search, color: Colors.grey),
                          ),
                          style: const TextStyle(color: Colors.white),
                          onChanged: (value) => filterNumbers(value),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: selectedNumbers
                              .map((num) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0),
                                    child: Container(
                                      width: 75,
                                      height: 65,
                                      child: Chip(
                                        label: Text(
                                          '$num',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20),
                                        ),
                                        backgroundColor: softWhite,
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Color(0xFFD7B58D)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                        Expanded(
                          child: GridView.builder(
                            padding: EdgeInsets.only(top: 10),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                            ),
                            itemCount: filteredNumbers.length,
                            itemBuilder: (context, index) {
                              int number = filteredNumbers[index];
                              bool isSelected =
                                  selectedNumbers.contains(number);
                              return GestureDetector(
                                // onTap: () => toggleNumber(number),
                                onTap: () {
                                  // if (!selectedNumbers.contains(number)) {
                                  print(number);
                                  print("THIS IS TEST");
                                  setState(() {
                                    if (selectedNumber != 0) {
                                      selectedNumbers = selectedNumbers.sublist(
                                          0, selectedNumbers.length - 1);
                                    }
                                    selectedNumber = number;
                                    selectedNumbers = [
                                      ...selectedNumbers,
                                      number
                                    ];
                                  });
                                  // }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.grey
                                        : const Color(0xFF222222)
                                            .withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0xFFD7B58D)),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$number',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.white,
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                          ),
                          onPressed: () {
                            if (selectedNumbers.isEmpty) {
                              // Show a message if no number is selected
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please select a number before proceeding.')),
                              );
                            } else {
                              // Check if the user is logged in
                              if (isLoggedIn) {
                                // Navigate to the payment page
                                context.push(
                                    Uri(path: '/payment', queryParameters: {
                                  "lotteryId": widget.lotteryId,
                                  "selectedNumber": selectedNumber.toString()
                                }).toString());
                              } else {
                                // Navigate to the login page
                                context.go('/login');
                              }
                            }
                          },
                          child: const Text('Buy Ticket',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                        ),
                      ],
                    ),
                  )));
            }));
  }
}
