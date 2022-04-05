class User {
  int id = 0;
  String name = '';
  String email = '';
  String phone = '';

  User({
    this.id = 0,
    this.name = '',
    this.email = '',
    this.phone = '',
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  List<User> listFromJson(json) {
    return (json as List).map((e) => User.fromJson(e)).toList();
  }
}
