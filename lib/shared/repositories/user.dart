import 'package:dio/native_imp.dart';
import 'package:sample_flutter_search/shared/models/user.dart';
import 'package:sample_flutter_search/shared/repositories/user_interface.dart';

class UserRepository implements IUserRepository {
  final DioForNative _client = DioForNative();
  final String _endpoint = 'https://jsonplaceholder.typicode.com';

  final User _userModel = User();

  _handleServerError() =>
      Future.error('The server is not current available, please try it later.');

  @override
  Future<List<User>> getAll() async {
    try {
      final response = await _client.get('$_endpoint/users');
      return _userModel.listFromJson(response.data);
    } catch (_) {
      return _handleServerError();
    }
  }

  @override
  Future<User> getById({required int id}) async {
    try {
      final response = await _client.get('$_endpoint/users?id=$id');
      List<User> users = _userModel.listFromJson(response.data);

      if (users.isEmpty) {
        return Future.error('No user found with the id \'$id\'.');
      }

      return users[0];
    } catch (_) {
      return _handleServerError();
    }
  }

  @override
  Future<List<User>> getByName({required String name}) async {
    try {
      final response = await _client.get('$_endpoint/users?name=$name');
      List<User> users = _userModel.listFromJson(response.data);

      if (users.isEmpty) {
        return Future.error('No user found with the name \'$name\'.');
      }

      return users;
    } catch (_) {
      return _handleServerError();
    }
  }
}
