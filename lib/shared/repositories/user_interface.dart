import 'package:sample_flutter_search/shared/models/user.dart';

abstract class IUserRepository {
  Future<User> getById({required int id});
  Future<List<User>> getByName({required String name});
  Future<List<User>> getAll();
}
