import 'package:flutter/material.dart';
import 'package:sample_flutter_search/home/home_controller.dart';
import 'package:sample_flutter_search/home/widgets/input_field.dart';
import 'package:sample_flutter_search/home/widgets/submit_button.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller = HomeController();
  final TextEditingController userIdInputController = TextEditingController();
  final TextEditingController userNameInputController = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _maxResultContainerHeight = MediaQuery.of(context).size.height - 295;

    Widget listItem(id, email, phone) {
      return Card(
        child: ListTile(
          leading: Text(id, style: TextStyle(color: Colors.grey[200])),
          title: Text(email.toLowerCase()),
          subtitle: Text('Phone: $phone'),
        ),
      );
    }

    void handleSubmit() {
      _controller.searchUsers(
        userIdInputController.text,
        userNameInputController.text,
        context,
      );
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InputField(
              controller: userIdInputController,
              hintText: 'User ID',
              onlyNumbers: true,
              onChanged: (_) => userNameInputController.clear(),
            ),
            InputField(
              controller: userNameInputController,
              hintText: 'User Name',
              onChanged: (_) => userIdInputController.clear(),
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: _controller.busy,
              builder: (BuildContext context, bool busy, Widget? child) {
                return Column(
                  children: [
                    SubmitButton(busy: busy, handleSubmit: handleSubmit),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 200),
                      child: Column(
                        children: [
                          SizedBox(
                            height: _controller.hasResults
                                ? _maxResultContainerHeight
                                : 0,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: _controller.users.length,
                              itemBuilder: (BuildContext context, int index) {
                                return listItem(
                                  _controller.users[index].id.toString(),
                                  _controller.users[index].email,
                                  _controller.users[index].phone,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
