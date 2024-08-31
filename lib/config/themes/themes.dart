import 'package:everlink_lottery_app/domain/value_objects/language.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color(0xFF6D9DC5),
  secondary: const Color(0xFF006569),
  tertiary: const Color(0xFF006569),
  primary: const Color(0xFF6D9DC5),
);

final trueBlackColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xFF887E5F),
  // secondary: const Color(0xFF006569),
  // tertiary: Color.fromARGB(255, 5, 161, 167),
  // primary: const Color(0xFF6D9DC5),
  primary: const Color(0xFFF5EDD9),
  // surface: Color.fromARGB(243, 29, 36, 41),
  // surface: Color.fromARGB(146, 34, 38, 42),
  // onSurface: Colors.white,
  onSurface: Color.fromARGB(121, 53, 66, 77),
  surface: Colors.black,
  // primaryContainer: Color.fromARGB(121, 53, 66, 77),
  primaryContainer: const Color(0xFFF5EDD9),
  // surface: Color.fromARGB(243, 29, 36, 41),
);

final darkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xFF6D9DC5),
  secondary: const Color(0xFF006569),
  tertiary: Color.fromARGB(255, 5, 161, 167),
  primary: const Color(0xFF6D9DC5),
  // surface: Color.fromARGB(243, 29, 36, 41),
  surface: Color.fromARGB(255, 34, 38, 42),
  onBackground: Colors.white,
  primaryContainer: const Color(0xFF35424d),
);

ThemeData lightTheme(Language locale) {
  return ThemeData(
    brightness: Brightness.light,
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: MaterialStateProperty.all(const TextStyle(
        color: Color.fromARGB(255, 17, 41, 98),
      )),
    ),
    fontFamily: locale.code == "am"
        ? 'NokiaPureHeadline'
        : GoogleFonts.nunitoSansTextTheme().bodyLarge?.fontFamily,
    textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
      titleMedium: GoogleFonts.nunitoSansTextTheme().titleMedium?.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w200,
            color: Colors.white,
          ),
    ),
    primaryColor: const Color(0xFF6D9DC5),
    scaffoldBackgroundColor: const Color(0xFFFAFDFF),
    colorScheme: lightColorScheme,
  );
}

ThemeData darkTheme(Language locale, bool isTrueDark) {
  return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
        backgroundColor:
            isTrueDark ? trueBlackColorScheme.surface : darkColorScheme.surface,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor:
            isTrueDark ? trueBlackColorScheme.surface : darkColorScheme.surface,
        labelTextStyle: const WidgetStatePropertyAll(TextStyle(
          color: Color(0xFF6D9DC5),
        )),
      ),
      fontFamily: locale.code == "am"
          ? 'NokiaPureHeadline'
          : GoogleFonts.nunitoSansTextTheme().bodyLarge?.fontFamily,
      textTheme: GoogleFonts.nunitoSansTextTheme()
          .copyWith(
              titleMedium:
                  GoogleFonts.nunitoSansTextTheme().titleMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                      ))
          .apply(
            bodyColor: Color(0xFFF5EDD9),
            displayColor: Color(0xFFF5EDD9),
          ),
      primaryColor: const Color(0xFFF5EDD9),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(trueBlackColorScheme.primary),
      )),
      // scaffoldBackgroundColor: const Color(0x000AFDFF),
      // scaffoldBackgroundColor: Color.fromARGB(153, 27, 28, 30),
      // scaffoldBackgroundColor: Color.fromARGB(255, 34, 38, 42),
      colorScheme: isTrueDark ? trueBlackColorScheme : darkColorScheme);
}
