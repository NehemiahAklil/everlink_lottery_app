import 'package:everlink_lottery_app/data/remote_repository/firebase_entry_repository.dart';
import 'package:everlink_lottery_app/data/remote_repository/firebase_payment_repository.dart';
import 'package:everlink_lottery_app/domain/entity/entry_ticket.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage(
      {super.key, required this.lotteryId, required this.selectedNumber});
  final String? lotteryId;
  final int? selectedNumber;
  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isTelebirrSelected = false;
  bool isMpesaSelected = false;
  bool isBankSelected = false;

  String _selectedPhoneNumber = '';
  String _userPhoneNumber = '';
  String _bankAccountDetails = '';
  File? _image;
  final ImagePicker _picker = ImagePicker();

  final FirebaseStorage _storage = locator<FirebaseStorage>();
  final FirebaseAuth _auth = locator<FirebaseAuth>();
  final FirebaseFirestore _firestore = locator<FirebaseFirestore>();
  final FirebasePaymentRepository _paymentRepository =
      locator<FirebasePaymentRepository>();
  final FirebaseEntryTicketRepository _entryTicketRepository =
      locator<FirebaseEntryTicketRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: CustomBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go('/ticketnum');
                      },
                      icon: const Icon(Icons.arrow_back_ios_sharp,
                          color: Colors.white),
                      iconSize: 30,
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Choose Your Payment Method',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 30),
                _buildPaymentOptions(),
                const SizedBox(height: 20),
                _buildPhoneNumberText(),
                const SizedBox(height: 20),
                _buildImagePreview(),
                const SizedBox(height: 20),
                _buildPhoneInput(),
                const SizedBox(height: 20),
                _buildUploadInstructions(),
                const SizedBox(height: 20),
                _buildImageButtons(),
                const SizedBox(height: 40),
                _buildProceedButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentOptions() {
    return Column(
      children: [
        _buildCheckbox('Telebirr', isTelebirrSelected, (value) {
          setState(() {
            isTelebirrSelected = value!;
            _selectedPhoneNumber = isTelebirrSelected ? '0900990088' : '';
            _resetOthers('Telebirr');
          });
        }),
        _buildCheckbox('Mpesa', isMpesaSelected, (value) {
          setState(() {
            isMpesaSelected = value!;
            _selectedPhoneNumber = isMpesaSelected ? '0700880098' : '';
            _resetOthers('Mpesa');
          });
        }),
        _buildCheckbox('Bank', isBankSelected, (value) {
          setState(() {
            isBankSelected = value!;
            _bankAccountDetails = isBankSelected
                ? 'Commercial Bank: 1000427446439\nAbissinia Bank: 10233445'
                : '';
            // Don't reset bank details here
            if (isBankSelected) {
              _resetOthers('Bank');
            }
          });
        }),
      ],
    );
  }

  Widget _buildCheckbox(
      String title, bool value, ValueChanged<bool?> onChanged) {
    return CheckboxListTile(
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      value: value,
      onChanged: onChanged,
      activeColor: Colors.blueAccent,
      checkColor: Colors.white,
    );
  }

  void _resetOthers(String selected) {
    if (selected != 'Telebirr') isTelebirrSelected = false;
    if (selected != 'Mpesa') isMpesaSelected = false;
    // No need to reset bank details here
  }

  Widget _buildPhoneNumberText() {
    return Column(
      children: [
        Text(
          _selectedPhoneNumber.isNotEmpty
              ? 'Phone Number: $_selectedPhoneNumber'
              : '',
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
        Text(
          _bankAccountDetails.isNotEmpty
              ? 'Bank Account Details: $_bankAccountDetails'
              : '',
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ],
    );
  }

  Widget _buildImagePreview() {
    return _image != null
        ? Image.file(_image!, height: 150, width: 150, fit: BoxFit.cover)
        : const Text('No image selected',
            style: TextStyle(color: Colors.white));
  }

  Widget _buildPhoneInput() {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Enter your phone number',
        hintStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.black54,
        border: const OutlineInputBorder(),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      ),
      onChanged: (value) {
        setState(() {
          _userPhoneNumber = value;
        });
      },
    );
  }

  Widget _buildUploadInstructions() {
    return const Text(
      'To contact you please enter your phone number',
      style: TextStyle(
          color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildImageButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildImageButton('Take Photo', ImageSource.camera),
        _buildImageButton('Upload Image', ImageSource.gallery),
      ],
    );
  }

  Widget _buildImageButton(String title, ImageSource source) {
    return ElevatedButton(
      onPressed: () async {
        final pickedFile = await _picker.pickImage(source: source);
        setState(() {
          if (pickedFile != null) {
            _image = File(pickedFile.path);
          } else {
            _image = null;
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xD99D926E),
        side: const BorderSide(color: Color(0xFFD7B58D)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _buildProceedButton() {
    return ElevatedButton(
      onPressed: () async {
        if (isTelebirrSelected || isMpesaSelected || isBankSelected) {
          if (isTelebirrSelected && !_userPhoneNumber.startsWith('09')) {
            _showError('Telebirr numbers must start with 09');
            return;
          }
          if (isMpesaSelected && !_userPhoneNumber.startsWith('07')) {
            _showError('Mpesa numbers must start with 07');
            return;
          }

          // Upload selected ticket number to Firebase (remove reference to selectedTicketNumber)
          // await _uploadTicketNumberToFirebase(widget.selectedTicketNumber);

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
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        backgroundColor: Color(0xD99D926E),
        side: const BorderSide(color: Color(0xFFD7B58D)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 10,
      ),
      child: const Text(
        'Proceed to Payment',
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Future<void> _uploadImageToFirebaseStorage() async {
    if (_image != null) {
      try {
        final ref = _storage
            .ref()
            .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        await ref.putFile(_image!);
        final downloadUrl = await ref.getDownloadURL();
        String paymentMethod = "";
        if (isBankSelected) paymentMethod = "Bank";
        if (isMpesaSelected) paymentMethod = "Mpesa";
        if (isTelebirrSelected) paymentMethod = "Telebirr";

        var entry = await _entryTicketRepository.create(
          id: widget.selectedNumber ?? 0,
          lotteryId: widget.lotteryId ?? "",
          userId: _auth.currentUser!.uid,
        );
        EntryTicket? entryTicket =
            entry.fold((error) => null, (newEntries) => newEntries);

        await _paymentRepository.create(
            imageUrl: downloadUrl,
            phoneNumber: _selectedPhoneNumber,
            paymentMethod: paymentMethod,
            isApproved: false,
            ticketId: entryTicket!.id);
        context.go('/home');
        print('Image uploaded to Firebase Storage: $downloadUrl');
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No image selected for upload');
    }
  }

  void _showError(String message) {
    final snackBar = SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.red)));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
