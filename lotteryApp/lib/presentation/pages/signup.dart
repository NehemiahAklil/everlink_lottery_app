import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/pages/Login.dart';
import 'package:flutter_application_1/presentation/pages/profilepage.dart';
import 'package:flutter_application_1/presentation/widgets/background.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final Color softWhite = const Color(0xFFF5F5F5);

  InputDecoration _inputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white),
      prefixIcon: Icon(icon, color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Color(0xFFD7B58D)),
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData icon) {
    return TextField(
      decoration: _inputDecoration(hintText, icon),
      style: const TextStyle(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 100, left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Create your account!',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
              const SizedBox(height: 40),
              _buildTextField('Email', Icons.email),
              const SizedBox(height: 35),
              _buildTextField('Username', Icons.person),
              const SizedBox(height: 35),
              _buildTextField('Password', Icons.lock),
              const SizedBox(height: 35),
              _buildTextField('Confirm password', Icons.lock),

              const SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Color(0xFFD7B58D)),
                  padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  // Add your login logic here
                },
                child: Text('Login', style: TextStyle(color: softWhite, fontSize: 20)),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  // Add your Google login logic here
                },
                icon: const Icon(Icons.g_translate),
                label: Text('Continue with Google', style: TextStyle(color: softWhite, fontSize: 20)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Color(0xFFD7B58D)),
                  padding: const EdgeInsets.symmetric(horizontal: 61, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                  },
                  child: Text(
                    'Have an account? Log in',
                    style: TextStyle(color: softWhite, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
