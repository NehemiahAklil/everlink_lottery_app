import 'dart:math';

String extractBeforeAt(String email) {
  final atIndex = email.indexOf('@');
  if (atIndex == -1) {
    return email; // If no '@' is found, return the original string
  }
  return email.substring(0, atIndex);
}

String camelCaseToSpaceSeparatedCapitalized(String input) {
  final List<String> words = input.split(RegExp(r'(?=[A-Z])'));
  return words
      .map((word) => "${word[0].toUpperCase()}${word.substring(1)}")
      .join(' ');
}

int pickRandomWinner(int participants) => Random().nextInt(participants) + 1;

Duration whenIsTheDate(DateTime date) {
  return date.difference(DateTime.now());
}
