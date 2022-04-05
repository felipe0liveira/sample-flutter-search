import 'package:flutter_test/flutter_test.dart';
import 'package:sample_flutter_search/shared/models/user.dart';

void main() {
  var jsonData = [
    {
      "id": 1,
      "name": 'John Doe',
      "email": 'john_doe@gmail.com',
      "phone": '+5512912345678'
    },
    {
      "id": 2,
      "name": "Jane Doe",
      "email": "jane_doe@gmail.com",
      "phone": "+5512912345678"
    }
  ];

  test('Model should have a contract', () {
    final User user = User.fromJson(jsonData[0]);

    expect(user.id.runtimeType, int);
    expect(user.id, 1);

    expect(user.name.runtimeType, String);
    expect(user.name, 'John Doe');

    expect(user.email.runtimeType, String);
    expect(user.email, 'john_doe@gmail.com');

    expect(user.phone.runtimeType, String);
    expect(user.phone, '+5512912345678');

    expect(user.runtimeType, User);
  });

  test('A valid JSON should create a User', () {
    final User user = User.fromJson(jsonData[1]);

    expect(user.id, 2);
    expect(user.name, 'Jane Doe');
    expect(user.email, 'jane_doe@gmail.com');
    expect(user.phone, '+5512912345678');

    expect(user.runtimeType, User);
  });

  test('A valid JSON List should create a User List', () {
    final List<User> users = User().listFromJson(jsonData);

    expect(users.length, 2);
    expect(users.runtimeType, List<User>);
  });

  test('User info should be empty when initialized without props', () {
    final User user = User();

    expect(user.id, 0);
    expect(user.name.isEmpty, true);
    expect(user.email.isEmpty, true);
    expect(user.phone.isEmpty, true);
  });
}
