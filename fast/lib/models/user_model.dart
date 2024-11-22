class User {
  final int id;
  final String username;
  final String nim;

  User({required this.id, required this.username, required this.nim});

  // Method untuk membuat objek User dari response JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['data']['id'],
      username: json['data']['username'],
      nim: json['data']['nim'],
    );
  }
}
