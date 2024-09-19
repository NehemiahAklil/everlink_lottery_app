String extractBeforeAt(String email) {
  final atIndex = email.indexOf('@');
  if (atIndex == -1) {
    return email; // If no '@' is found, return the original string
  }
  return email.substring(0, atIndex);
}
