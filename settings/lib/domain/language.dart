enum Language {
  english(flag: "🇺🇸", name: "English", code: "en", country: "GB"),
  amharic(flag: "🇪🇹", name: "አማርኛ", code: "am", country: "ET");

  const Language(
      {required this.flag,
        required this.name,
        required this.code,
        required this.country});
  final String flag;
  final String name;
  final String code;
  final String country;
}
