import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:settings/presentation/widgets/background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordVisibilityNotifier extends StateNotifier<Map<String, bool>> {
  PasswordVisibilityNotifier()
      : super({
    'currentPassword': true,
    'newPassword': true,
    'confirmPassword': true,
  });

  void toggleVisibility(String fieldKey) {
    state = {
      ...state,
      fieldKey: !state[fieldKey]!,
    };
  }
}

final passwordVisibilityProvider =
StateNotifierProvider<PasswordVisibilityNotifier, Map<String, bool>>(
        (ref) => PasswordVisibilityNotifier());

final currentPasswordControllerProvider =
Provider((_) => TextEditingController());
final newPasswordControllerProvider =
Provider((_) => TextEditingController());
final confirmPasswordControllerProvider =
Provider((_) => TextEditingController());

final validationMessageProvider = StateProvider<String?>((_) => null);

class ChangePassword extends ConsumerWidget {
  const ChangePassword({Key? key}) : super(key: key);

  static final formKey = GlobalKey<FormState>();

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }
    return null;
  }

  String? _validateConfirmPassword(
      String? confirmPassword, String newPassword) {
    if (confirmPassword != newPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _changePassword(BuildContext context, WidgetRef ref) {
    final currentPasswordController =
    ref.watch(currentPasswordControllerProvider);
    final newPasswordController = ref.watch(newPasswordControllerProvider);
    final confirmPasswordController =
    ref.watch(confirmPasswordControllerProvider);

    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password changed successfully!')),
      );
      currentPasswordController.clear();
      newPasswordController.clear();
      confirmPasswordController.clear();
    }
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required String fieldKey,
    required String? Function(String?) validator,
    required WidgetRef ref,
    TextStyle? labelStyle,
  }) {
    final visibilityState = ref.watch(passwordVisibilityProvider);
    final obscureText = visibilityState[fieldKey] ?? true;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: labelStyle,
        suffixIcon: IconButton(
          icon: Icon(
            obscureText ? Ionicons.eye_off : Ionicons.eye,
            color: Colors.white,
          ),
          onPressed: () {
            ref.read(passwordVisibilityProvider.notifier)
                .toggleVisibility(fieldKey);
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD7B58D)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final softWhite = const Color(0xFFF5F5F5);

    final currentPasswordController =
    ref.watch(currentPasswordControllerProvider);
    final newPasswordController = ref.watch(newPasswordControllerProvider);
    final confirmPasswordController =
    ref.watch(confirmPasswordControllerProvider);

    return Scaffold(
      body: CustomBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey, // Assign the formKey here
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Ionicons.chevron_back_outline,
                            color: Colors.white,
                          ),
                          iconSize: 30,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      alignment: Alignment.center,
                      child: Text(
                        AppLocalizations.of(context)!.changepassword,
                        style: TextStyle(
                          color: softWhite,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    _buildPasswordField(
                      controller: currentPasswordController,
                      label: AppLocalizations.of(context)!.currentpassword,
                      fieldKey: 'currentPassword',
                      validator: _validatePassword,
                      ref: ref,
                      labelStyle: TextStyle(color: softWhite),
                    ),
                    const SizedBox(height: 20),
                    _buildPasswordField(
                      controller: newPasswordController,
                      label: AppLocalizations.of(context)!.newpassword,
                      fieldKey: 'newPassword',
                      validator: _validatePassword,
                      ref: ref,
                      labelStyle: TextStyle(color: softWhite),
                    ),
                    const SizedBox(height: 20),
                    _buildPasswordField(
                      controller: confirmPasswordController,
                      label: AppLocalizations.of(context)!.confirmnewpassword,
                      fieldKey: 'confirmPassword',
                      validator: (confirmPassword) =>
                          _validateConfirmPassword(
                              confirmPassword, newPasswordController.text),
                      ref: ref,
                      labelStyle: TextStyle(color: softWhite),
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () => _changePassword(context, ref),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(color: Color(0xFFB07A4E)),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.reset,
                          style: TextStyle(fontSize: 20, color: softWhite),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
