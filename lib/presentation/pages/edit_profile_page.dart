import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/background.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  String? _imagePath; // Variable to hold the image path
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isExpanded = false;

  // Function to open the gallery
  Future<void> _openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFD7B58D)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _imagePath != null
                ? ClipOval(
                    child: Image.file(
                      File(_imagePath!),
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(
                    width: 150,
                    height: 150,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
            Positioned(
              bottom: -10,
              right: -5,
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: Color(0xFFD7B58D),
                  size: 40,
                ),
                onPressed: _openGallery,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "${AppLocalizations.of(context)!.username}: ${usernameController.text}",
            style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 12),
        Text(
            "${AppLocalizations.of(context)!.email}: ${usernameController.text}",
            style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 12),
        Text(
            "${AppLocalizations.of(context)!.phonenumber}: ${usernameController.text}",
            style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 12),
        Text(
            "${AppLocalizations.of(context)!.address}: ${usernameController.text}",
            style: const TextStyle(fontSize: 18)),
      ],
    );
  }

  Widget _buildExpandableButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFD7B58D)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.editprofile,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Icon(
              isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildTextField(
              AppLocalizations.of(context)!.username, usernameController),
          const SizedBox(height: 12),
          _buildTextField(AppLocalizations.of(context)!.email, emailController),
          const SizedBox(height: 12),
          _buildTextField(
              AppLocalizations.of(context)!.phonenumber, phoneController),
          const SizedBox(height: 12),
          _buildTextField(
              AppLocalizations.of(context)!.address, addressController),
          const SizedBox(height: 12),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: const BorderSide(color: Color(0xFFD7B58D)),
            ),
            onPressed: _saveProfile,
            child: Text(AppLocalizations.of(context)!.save),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "${AppLocalizations.of(context)!.address} $hint",
        contentPadding: const EdgeInsets.only(bottom: 2),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return " $hint ${AppLocalizations.of(context)!.isrequired} ";
        }
        return null;
      },
    );
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.profilesaved)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 15, left: 15),
            width: 450,
            child: ListView(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go('/home');
                      },
                      icon: const Icon(Icons.arrow_back_ios_sharp,
                          color: Colors.white),
                      iconSize: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _buildProfilePicture(),
                const SizedBox(height: 40),
                _buildUserInfo(),
                const SizedBox(height: 20),
                _buildExpandableButton(),
                if (isExpanded) _buildExpandableForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
