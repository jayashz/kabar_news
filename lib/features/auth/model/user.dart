class User {
  String id;
  String name;
  String email;
  String phone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map["_id"],
        name: map["name"] ?? "",
        email: map["email"] ?? "",
        phone: map["phone"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "email": email,
        "phone": phone,
      };
}
