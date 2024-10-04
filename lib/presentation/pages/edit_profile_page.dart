import 'dart:io'; 
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final ImagePicker _picker = ImagePicker();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isExpanded = false;
  String? _imagePath; 

  Future<void> _openGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _imagePath = image.path;
      });
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomBackground(
          child: Padding(
            padding: const EdgeInsets.only(top: 35, left: 12, right: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        context.go('/home');
                      },
                      icon: Icon(
                        Ionicons.chevron_back_outline,
                        color: Colors.white,
                      ),
                      iconSize: 30,
                    ),
                  ],
                ),
                _buildProfilePicture(),
                SizedBox(height: 20),
                _buildUserInfo(),
                SizedBox(height: 20),
                _buildExpandableButton(),
                if (isExpanded) _buildExpandableForm(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Color(0xFFD7B58D)),
                    backgroundColor: Colors.transparent,
                  ),
                  child: Text(AppLocalizations.of(context)!.save, style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePicture() {
    return Center(
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFD7B58D)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (_imagePath != null)
              ClipOval(
                child: Image.file(
                  File(_imagePath!),
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              )
            else
              const Icon(
                Icons.person,
                size: 70,
                color: Colors.white,
              ),
            Positioned(
              bottom: -8,
              right: -1,
              child: GestureDetector(
                onTap: _openGallery,
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 40,
                ),
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
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 12),
        Text(
          "${AppLocalizations.of(context)!.email}: ${emailController.text}",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 12),
        Text(
          "${AppLocalizations.of(context)!.phonenumber}: ${phoneController.text}",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 12),
        Text(
          "${AppLocalizations.of(context)!.address}: ${addressController.text}",
          style: TextStyle(fontSize: 18),
        ),
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
          _buildTextField(AppLocalizations.of(context)!.username, usernameController),
          const SizedBox(height: 12),
          _buildTextField(AppLocalizations.of(context)!.email, emailController),
          const SizedBox(height: 12),
          _buildTextField(AppLocalizations.of(context)!.phonenumber, phoneController),
          const SizedBox(height: 12),
          _buildTextField(AppLocalizations.of(context)!.address, addressController),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "${AppLocalizations.of(context)!.enter} $hint",
        contentPadding: EdgeInsets.only(bottom: 2),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$hint ${AppLocalizations.of(context)!.isrequired}';
        }

        if (hint == AppLocalizations.of(context)!.email) {
          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
          if (!emailRegex.hasMatch(value)) {
            return '${AppLocalizations.of(context)!.invalidemail}';
          }
        }
        if (hint == AppLocalizations.of(context)!.phonenumber) {
          final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
          if (!phoneRegex.hasMatch(value)) {
            return '${AppLocalizations.of(context)!.invalidphonenumber}';
          }
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
      setState(() {});
    }
  }
}
