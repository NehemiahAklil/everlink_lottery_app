import 'package:everlink_lottery_app/domain/value_objects/language.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'locale_provider.g.dart';
// final localeProvider = StateProvider<Language>((ref) => Language.english);

@riverpod
class LocaleState extends _$LocaleState {
  @override
  Language build() {
    return Language.english;
  }

  void changeLocale(Language language) {
    state = language;
  }
}
