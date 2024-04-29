class Profile {
  final String name;
  final String email;
  Profile({required this.email, required this.name});
  factory Profile.fromJson(Map<String, dynamic> jsonData) {
    return Profile(
      email: jsonData['email'],
      name: jsonData['name'],
    );
  }
}
