import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LANGUAGE_CODE = 'languageCode';
const String ENGLISH = 'en';
const String AMHARIC = 'am';

class LanguageNotifier extends StateNotifier<Locale> {
  LanguageNotifier() : super(const Locale(ENGLISH)) {
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
    state = _locale(languageCode);
  }

  Future<void> setLocale(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(LANGUAGE_CODE, languageCode);
    state = _locale(languageCode);
  }

  Locale _locale(String languageCode) {
    switch (languageCode) {
      case AMHARIC:
        return const Locale(AMHARIC);
      case ENGLISH:
      default:
        return const Locale(ENGLISH);
    }
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, Locale>((ref) {
  return LanguageNotifier();
});
