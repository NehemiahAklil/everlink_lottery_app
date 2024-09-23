import 'package:everlink_lottery_app/presentation/pages/bottomnav.dart';
import 'package:everlink_lottery_app/presentation/pages/drawerpage.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isTelebirrSelected = false;
  bool isMpesaSelected = false;
  bool isBankSelected = false;

  // Phone number for selected payment method (fixed at top)
  String _selectedPhoneNumber = '';

  // Phone number entered by the user
  String _userPhoneNumber = '';

  String _bankAccountDetails = '';
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final Color softWhite = const Color(0xFFF5F5F5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 35),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go('/ticketnum');
                      },
                      icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Choose Your Payment Method',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text('Telebirr', style: TextStyle(color: Colors.white)),
                value: isTelebirrSelected,
                onChanged: (value) {
                  setState(() {
                    isTelebirrSelected = value!;
                    _selectedPhoneNumber = isTelebirrSelected ? '0900990088' : '';
                    if (isTelebirrSelected) {
                      isMpesaSelected = false;
                      isBankSelected = false;
                      _bankAccountDetails = '';
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Mpesa', style: TextStyle(color: Colors.white)),
                value: isMpesaSelected,
                onChanged: (value) {
                  setState(() {
                    isMpesaSelected = value!;
                    _selectedPhoneNumber = isMpesaSelected ? '0700880098' : '';
                    if (isMpesaSelected) {
                      isTelebirrSelected = false;
                      isBankSelected = false;
                      _bankAccountDetails = '';
                    }
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Bank', style: TextStyle(color: Colors.white)),
                value: isBankSelected,
                onChanged: (value) {
                  setState(() {
                    isBankSelected = value!;
                    _bankAccountDetails = isBankSelected
                        ? 'Commercial Bank: 1000427446439\nAbissinia Bank: 10233445'
                        : '';
                    if (isBankSelected) {
                      isTelebirrSelected = false;
                      isMpesaSelected = false;
                      _selectedPhoneNumber = '';
                    }
                  });
                },
              ),
              const SizedBox(height: 20),


              Text(
                _selectedPhoneNumber.isNotEmpty ? 'Phone Number: $_selectedPhoneNumber' : '',
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
              Text(
                _bankAccountDetails.isNotEmpty
                    ? 'Bank Account Details: $_bankAccountDetails'
                    : '',
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),

              const SizedBox(height: 20),
              _image != null
                  ? Image.file(_image!)
                  : const Text('No image selected', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 20),

              // Instruction for user to enter their own phone number
              const Text(
                'To contact you please enter your phone number',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.black54,
                  border: const OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _userPhoneNumber = value; // Only update user's input, not the top phone number
                  });
                },
              ),
              const SizedBox(height: 20),

              const Text(
                'Pay and send the transaction screenshot',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
                      setState(() {
                        if (pickedFile != null) {
                          _image = File(pickedFile.path);
                        } else {
                          _image = null;
                        }
                      });
                    },
                    child: const Text('Take Photo', style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        if (pickedFile != null) {
                          _image = File(pickedFile.path);
                        } else {
                          _image = null;
                        }
                      });
                    },
                    child: const Text('Upload Image', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (isTelebirrSelected || isMpesaSelected || isBankSelected) {
                    // Validate user phone number
                    if (isTelebirrSelected && !_userPhoneNumber.startsWith('09')) {
                      _showError('Telebirr numbers must start with 09');
                      return;
                    }
                    if (isMpesaSelected && !_userPhoneNumber.startsWith('07')) {
                      _showError('Mpesa numbers must start with 07');
                      return;
                    }

                    // Proceed if validation passes
                    print('Selected payment methods:');
                    if (isTelebirrSelected) {
                      print('Telebirr selected with Phone Number: $_selectedPhoneNumber');
                    }
                    if (isMpesaSelected) {
                      print('Mpesa selected with Phone Number: $_selectedPhoneNumber');
                    }
                    if (isBankSelected) {
                      print('Bank selected with Account Details: $_bankAccountDetails');
                    }
                    if (_image != null) {
                      _uploadImageToFirebaseStorage();
                    }
                    print('User entered phone number: $_userPhoneNumber');
                  } else {
                    print('Please select at least one payment method');
                  }
                },
                child: const Text('Proceed to Payment', style: TextStyle(color: Colors.black)),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _uploadImageToFirebaseStorage() async {
    if (_image != null) {
      try {
        final ref = _storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        await ref.putFile(_image!);
        final downloadUrl = await ref.getDownloadURL();
        print('Image uploaded to Firebase Storage: $downloadUrl');
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No image selected for upload');
    }
  }

  // Method to show error messages
  void _showError(String message) {
    final snackBar = SnackBar(content: Text(message, style: const TextStyle(color: Colors.red)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}