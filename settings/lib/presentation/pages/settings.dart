import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:settings/controller/language_controller.dart';
import 'package:settings/presentation/pages/setting_changepassword.dart';
import 'package:settings/presentation/pages/setting_language.dart';
import 'package:settings/presentation/widgets/background.dart';
import 'package:settings/presentation/pages/setting_privacy.dart';
import 'package:settings/presentation/pages/setting_help.dart';
import 'package:settings/presentation/pages/settings_item.dart';
import 'package:settings/presentation/pages/darkmode_switch.dart';
import 'package:settings/presentation/pages/setting_logout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Settings extends ConsumerWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(languageProvider); 
    final Color softWhite = const Color(0xFFF5F5F5);
    bool isDarkMode = false;
    void _showLanguageMenu(BuildContext context, WidgetRef ref) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return LanguageSelectionDialog(
            onLanguageSelected: (String language) async {
              final languageNotifier = ref.read(languageProvider.notifier);
              await languageNotifier.setLocale(language == 'አማርኛ' ? 'am' : 'en');
              MyApp.setLocale(context, ref.read(languageProvider));
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

    Future<void> _performLogout(BuildContext context) async {

    }

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
                      icon:
                          Icon(Ionicons.chevron_back_outline, color: softWhite),
                      iconSize: 30,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 90),
              Text(
                AppLocalizations.of(context)!.settings,
                style: TextStyle(
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
                    DarkmodeSwitch(
                      title: AppLocalizations.of(context)!.darkmode,
                      icon: Ionicons.moon,
                      bgcolor: softWhite,
                      iconColor: Colors.black,
                      value: isDarkMode,
                      onTap: (value) {
                        isDarkMode = value; 
                      },
                    ),
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
                              builder: (context) => ChangePassword()),
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
                        _showLanguageMenu(context, ref);
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
                          _performLogout(context);
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
