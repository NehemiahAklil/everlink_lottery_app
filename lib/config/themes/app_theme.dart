import 'package:everlink_lottery_app/config/themes/themes.dart';
import 'package:everlink_lottery_app/domain/value_objects/language.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  final Language locale;
  AppTheme(this.locale);

  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: WidgetStateProperty.all(const TextStyle(
          color: Color.fromARGB(255, 17, 41, 98),
        )),
      ),
      // fontFamily: this.locale.code == "am"
      // ? 'NokiaPureHeadline'
      // : GoogleFonts.nunitoSansTextTheme().bodyLarge?.fontFamily,
      textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
        titleMedium: GoogleFonts.nunitoSansTextTheme().titleMedium?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w200,
              color: Colors.black,
            ),
      ),
      primaryColor: const Color(0xFF6D9DC5),
      scaffoldBackgroundColor: const Color(0xFFFAFDFF),
      colorScheme: lightColorScheme,
    );
  }
}
