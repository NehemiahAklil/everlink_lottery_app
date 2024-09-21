import 'package:flutter/material.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:go_router/go_router.dart';

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
  String _phoneNumber = '';
  String _bankAccountDetails = '';
  String _selectedLottery = '';
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late CollectionReference _paymentsCollection;
  String selectedLotteryNumber = '';

  @override
  void initState() {
    super.initState();
    _paymentsCollection = _firestore.collection('payments');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    selectedLotteryNumber = arguments?['selectedLotteryNumber'] ?? '';
  }

  Future<void> _uploadData(String selectedLotteryNumber) async {
    if (_image == null || !_image!.existsSync()) {
      _showSnackBar('No image selected for upload');
      return;
    }

    String? imageUrl = await _uploadImageToFirebaseStorage();

    if (imageUrl != null) {
      try {
        await _paymentsCollection.add({
          'phoneNumber': _phoneNumber,
          'imageUrl': imageUrl,
          'paymentMethod': isTelebirrSelected
              ? 'Telebirr'
              : isMpesaSelected
              ? 'Mpesa'
              : 'Bank',
          'selectedLottery': selectedLotteryNumber
        });
        _showSnackBar('Data uploaded successfully!');
      } catch (e) {
        print('Error uploading data to Firestore: $e');
        _showSnackBar('Error uploading data to Firestore: $e');
      }
    }
  }

  Future<String?> _uploadImageToFirebaseStorage() async {
    try {
      final ref = _storage.ref().child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
      await ref.putFile(_image!);
      final downloadUrl = await ref.getDownloadURL();
      _showSnackBar('Image uploaded to Firebase Storage: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      _showSnackBar('Error uploading image: $e');
      return null;
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        body: CustomBackground(
        child: SingleChildScrollView(
        child: Container(
        margin: const EdgeInsets.only(top: 50),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    IconButton(
    onPressed: () {
    context.go('/ticketnum');
    },
    icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
    iconSize: 30,
    ),
    Text(
    'Choose Your Payment Method',
    style: TextStyle(
    color: Colors.white,
    fontSize: screenWidth < 400 ? 18 : 24,
    ),
    ),
    const SizedBox(height: 20),
    CheckboxListTile(
    title: Text(
    'Telebirr',
    style: TextStyle(color: Colors.white, fontSize: screenWidth < 400 ? 16 : 20),
    ),
    value: isTelebirrSelected,
    onChanged: (value) {
    setState(() {
    isTelebirrSelected = value!;
    _phoneNumber = isTelebirrSelected ? '0900990088' : '';
    if (isTelebirrSelected) {
    isMpesaSelected = false;
    isBankSelected = false;
    _bankAccountDetails = '';
    }
    });
    },
    ),
    CheckboxListTile(
    title: Text(
    'Mpesa',
    style: TextStyle(color: Colors.white, fontSize: screenWidth < 400 ? 16 : 20),
    ),
    value: isMpesaSelected,
    onChanged: (value) {
    setState(() {
    isMpesaSelected = value!;
    _phoneNumber = isMpesaSelected ? '0700880098' : '';
    if (isMpesaSelected) {
    isTelebirrSelected = false;
    isBankSelected = false;
    _bankAccountDetails = '';
    }
    });
    },
    ),
    CheckboxListTile(
    title: Text(
    'Bank',
    style: TextStyle(color: Colors.white, fontSize: screenWidth < 400 ? 16 : 20),
    ),
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
    _phoneNumber = '';

    }
    });
    },
    ),
    const SizedBox(height: 20),
    Text(
    _phoneNumber.isNotEmpty ? 'Phone Number: $_phoneNumber' : '',
    style: TextStyle(color: Colors.white, fontSize: screenWidth < 400 ? 18 : 24),
    ),
    Text(
    _bankAccountDetails.isNotEmpty ? 'Bank Account Details: $_bankAccountDetails' : '',
    style: TextStyle(color: Colors.white, fontSize: screenWidth < 400 ? 18 : 24),
    ),
    const SizedBox(height: 20),
    _image != null
    ? Image.file(_image!)
        : const Text('No image selected', style: TextStyle(color: Colors.white)),
    const SizedBox(height: 20),
    Text(
    'Pay and send the transaction screenshot',
    style: TextStyle(color: Colors.white, fontSize: screenWidth < 400 ? 18 : 24),
    ),
    const SizedBox(height: 20),
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    ElevatedButton(
    onPressed: () async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
    _image = pickedFile != null ? File(pickedFile.path) : null;
    });
    },
    child: Text(
    'Take Photo',
    style: TextStyle(color: Colors.black, fontSize: screenWidth < 400 ? 14 : 18),
    ),
    ),
                ElevatedButton(
                  onPressed: () async {
                    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      _image = pickedFile != null ? File(pickedFile.path) : null;
                    });
                  },
                  child: Text(
                    'Upload Image',
                    style: TextStyle(color: Colors.black, fontSize: screenWidth < 400 ? 14 : 18),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'To contact you please enter your phone number',
              style: TextStyle(color: Colors.white, fontSize: screenWidth < 400 ? 18 : 24),
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
                  _phoneNumber = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (isTelebirrSelected || isMpesaSelected || isBankSelected) {
                  _uploadData(selectedLotteryNumber);
                } else {
                  _showSnackBar('Please select at least one payment method');
                }
              },
              child: const Text('Proceed to Payment', style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 40),

          ],
        ),
      ),
    ),
  ),
);
} }