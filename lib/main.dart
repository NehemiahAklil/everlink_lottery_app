import 'package:everlink_lottery_app/config/themes/themes.dart';
import 'package:everlink_lottery_app/domain/value_objects/language.dart';
import 'package:everlink_lottery_app/presentation/pages/onboarding/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Theme Settings
      themeMode: ThemeMode.dark,
      theme: lightTheme(Language.english),
      darkTheme: darkTheme(Language.english, true),
      // home: Scaffold(body: Center(child: PulsingIconsRow())),
      home: const OnboardingPage(),
    );
  }
}
