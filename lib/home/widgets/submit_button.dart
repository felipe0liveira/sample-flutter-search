import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final bool busy;
  final Function() handleSubmit;

  const SubmitButton({
    Key? key,
    required this.busy,
    required this.handleSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: busy ? null : handleSubmit,
      child: busy
          ? SizedBox(
              height: 16,
              width: 16,
              child: CircularProgressIndicator(
                color: Colors.grey[400],
                strokeWidth: 2,
              ),
            )
          : const Text('Search'),
    );
  }
}
