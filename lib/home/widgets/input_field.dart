import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool onlyNumbers;
  final Function(String inputValue) onChanged;

  const InputField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.onlyNumbers = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? inputFormatters =
        onlyNumbers ? [FilteringTextInputFormatter.digitsOnly] : null;

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: hintText),
      keyboardType: TextInputType.number,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
    );
  }
}
