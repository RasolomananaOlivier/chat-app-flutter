class User {
  String id, firstName, lastName, avatarFileName, bio, email;

  User(
      {required this.id,
      required this.avatarFileName,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.bio});

  String get name {
    return firstName + ' ' + lastName;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['_id'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        email: json['email'] as String,
        avatarFileName: json['avatarFileName'] as String,
        bio: json['bio'] as String);
  }
}
