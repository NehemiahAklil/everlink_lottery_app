import 'package:everlink_lottery_app/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:everlink_lottery_app/presentation/pages/settings/setting_changepassword.dart';
import 'package:everlink_lottery_app/presentation/pages/settings/setting_language.dart';
import 'package:everlink_lottery_app/presentation/widgets/background.dart';
import 'package:everlink_lottery_app/presentation/pages/settings/setting_privacy.dart';
import 'package:everlink_lottery_app/presentation/pages/settings/setting_help.dart';
import 'package:everlink_lottery_app/presentation/pages/settings/settings_item.dart';
import '../../../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider);
    const Color softWhite = Color(0xFFF5F5F5);

    void showLanguageMenu(BuildContext context, WidgetRef ref) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return LanguageSelectionDialog(
            onLanguageSelected: (String language) async {
              final languageNotifier = ref.read(languageProvider.notifier);
              await languageNotifier
                  .setLocale(language == 'አማርኛ' ? 'am' : 'en');
              
              
            },
          );
        },
      );
    }

    void showLogoutDialog(BuildContext context, VoidCallback onConfirm) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context)!.logout),
            content: Text(AppLocalizations.of(context)!.logout_text),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(AppLocalizations.of(context)!.cancel),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onConfirm();
                },
                child: Text(AppLocalizations.of(context)!.logout),
              ),
            ],
          );
        },
      );
    }

    Future<void> performLogout(BuildContext context) async {}

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomBackground(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 45, left: 7),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Ionicons.chevron_back_outline,
                          color: softWhite),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90),
              Text(
                AppLocalizations.of(context)!.settings,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: softWhite,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Settingsitem(
                      title: AppLocalizations.of(context)!.changepassword,
                      icon: Ionicons.lock_closed,
                      bgcolor: softWhite,
                      iconColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChangePassword()),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Settingsitem(
                      title: AppLocalizations.of(context)!.language,
                      icon: Ionicons.language_outline,
                      bgcolor: softWhite,
                      iconColor: Colors.black,
                      onTap: () {
                        showLanguageMenu(context, ref);
                      },
                    ),
                    const SizedBox(height: 30),
                    Settingsitem(
                      title: AppLocalizations.of(context)!.help,
                      icon: Ionicons.help,
                      bgcolor: softWhite,
                      iconColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Help()),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Settingsitem(
                      title: AppLocalizations.of(context)!.privacy,
                      icon: Ionicons.shield_checkmark,
                      bgcolor: softWhite,
                      iconColor: Colors.black,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Privacy()),
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    Settingsitem(
                      title: AppLocalizations.of(context)!.logout,
                      icon: Ionicons.log_out,
                      bgcolor: softWhite,
                      iconColor: Colors.black87,
                      onTap: () {
                        showLogoutDialog(context, () {
                          performLogout(context);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
