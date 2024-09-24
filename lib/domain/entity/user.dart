class UserProfile {
  UserProfile(
      {required this.displayName,
      required this.phoneNumber,
      required this.admin,
      this.uid});
  UserProfile.admin(this.uid) {
    admin = true;
    phoneNumber = "";
    displayName = "";
  }

  String? phoneNumber;
  String? displayName;
  final String? uid;
  bool? admin;

  factory UserProfile.fromFirestore(Map<String, dynamic> firestoreData) {
    return UserProfile(
      displayName: firestoreData['name'],
      uid: firestoreData['uid'],
      admin: firestoreData['admin'] ?? false,
      phoneNumber: firestoreData['phoneNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phoneNumber': phoneNumber ?? "",
      'uid': uid,
      'admin': admin ?? false
    };
  }
}
