import 'package:everlink_lottery_app/presentation/pages/bottomnav.dart';
import 'package:everlink_lottery_app/presentation/pages/drawerpage.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:flutter/material.dart';
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
  String _selectedPaymentMethod = '';
  String _phoneNumber = '';
  String _bankAccountDetails = '';
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final FirebaseStorage _storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Select Payment Method'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            RadioListTile(
              title: const Text('Telebirr'),
              value: 'Telebirr',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value as String;
                  _phoneNumber = '0900990088';
                });
              },
            ),
            RadioListTile(
              title: const Text('Mpesa'),
              value: 'Mpesa',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value as String;
                  _phoneNumber = '0700880098';
                });
              },
            ),
            RadioListTile(
              title: const Text('Bank'),
              value: 'Bank',
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  _selectedPaymentMethod = value as String;
                  _bankAccountDetails = 'Commercial Bank: 1000427446439\nAbissinia Bank: 10233445';
                });
              },
            ),
            const SizedBox(height: 20),
            Text(_phoneNumber.isNotEmpty ? 'Phone Number: $_phoneNumber' : ''),
            Text(_bankAccountDetails.isNotEmpty ? 'Bank Account Details: $_bankAccountDetails' : ''),
            const SizedBox(height: 20),
            _image != null ? Image.file(_image!) : const Text('No image selected'),
            const SizedBox(height: 20),
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
              child: const Text('Upload Screenshot'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment method selection
                if (_selectedPaymentMethod.isNotEmpty) {
                  // Process payment with selected method
                  print('Selected payment method: $_selectedPaymentMethod');
                  if (_phoneNumber.isNotEmpty) {
                    print('Phone Number: $_phoneNumber');
                  }
                  if (_bankAccountDetails.isNotEmpty) {
                    print('Bank Account Details: $_bankAccountDetails');
                  }
                  if (_image != null) {
                    _uploadImageToFirebaseStorage();
                  }
                } else {
                  print('Please select a payment method');
                }
              },
              child: const Text('Proceed to Payment'),
            ),
          ],
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
}