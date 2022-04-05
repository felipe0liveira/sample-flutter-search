import 'package:flutter/material.dart';
import 'package:sample_flutter_search/shared/models/user.dart';
import 'package:sample_flutter_search/shared/repositories/user.dart';

class HomeController {
  final UserRepository _userRepository = UserRepository();
  final busy = ValueNotifier(false);

  bool get hasResults => users.isNotEmpty;

  List<User> users = [];

  void searchUsers(String id, String name, BuildContext context) async {
    users = [];
    busy.value = true;

    try {
      if (id.isNotEmpty) {
        users = [await _userRepository.getById(id: int.parse(id))];
      } else if (name.isNotEmpty) {
        users = await _userRepository.getByName(name: name);
      } else {
        users = await _userRepository.getAll();
      }
    } catch (e) {
      String errorMessage = e.toString();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      busy.value = false;
    }
  }
}
