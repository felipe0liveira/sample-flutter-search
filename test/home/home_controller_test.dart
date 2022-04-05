import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_flutter_search/home/home_controller.dart';
import 'package:sample_flutter_search/shared/models/user.dart';

void main() {
  test('Controller should have a contract', () {
    HomeController controller = HomeController();

    expect(controller.users.runtimeType, List<User>);
    expect(controller.hasResults.runtimeType, bool);
    expect(controller.busy.runtimeType, ValueNotifier<bool>);
    expect(controller.busy.value.runtimeType, bool);
  });
  test('Controller should have an initial state', () {
    HomeController controller = HomeController();

    expect(controller.users, isEmpty);
    expect(controller.hasResults, isFalse);
    expect(controller.busy.value, isFalse);
  });
}
