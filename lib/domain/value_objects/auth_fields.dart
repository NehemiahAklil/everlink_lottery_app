import 'package:flutter/material.dart';

class AuthFields {
  final TextEditingController email;
  final TextEditingController password;
  TextEditingController confirmPassword = TextEditingController();
  AuthFields.signup(this.email, this.password, this.confirmPassword);
  AuthFields.login(this.email, this.password);
}
