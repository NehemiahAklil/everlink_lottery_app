import 'package:everlink_lottery_app/application/locale_provider.dart';
import 'package:everlink_lottery_app/config/router/routes.dart';
import 'package:everlink_lottery_app/config/themes/themes.dart';
import 'package:everlink_lottery_app/domain/value_objects/language.dart';
import 'package:everlink_lottery_app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  @override
  Widget build(BuildContext context) {
    final Language locale = ref.watch(localeStateProvider);
    return MaterialApp.router(
      title: 'Everlink Lottery App',

      // Localization Settings
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(locale.code),

      debugShowCheckedModeBanner: false,
      // Theme Settings
      themeMode: ThemeMode.dark,
      theme: lightTheme(Language.english),
      darkTheme: darkTheme(Language.english, true),

      // Routing
      routerConfig: router,
    );
  }
}
