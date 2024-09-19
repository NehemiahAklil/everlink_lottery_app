import 'package:everlink_lottery_app/domain/value_objects/auth_fields.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_field_controller_provider.g.dart';

@riverpod
class AuthFieldsNotifier extends _$AuthFieldsNotifier {
  bool _isLogin = false;

  @override
  AuthFields build() {
    return AuthFields.signup(TextEditingController(), TextEditingController(),
        TextEditingController());
  }

  void setLogin() => _isLogin = true;
  void setSignUp() => _isLogin = false;

  void clear() {
    state = _isLogin
        ? AuthFields.login(TextEditingController(), TextEditingController())
        : AuthFields.signup(TextEditingController(), TextEditingController(),
            TextEditingController());
  }
}
