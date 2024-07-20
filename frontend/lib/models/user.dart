class User {
  String userId;
  String name;
  String username;

  User({
    required this.userId,
    required this.name,
    required this.username
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      name: json['name'],
      username: json['username']
    );
  }
}