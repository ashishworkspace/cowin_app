import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintTextInput;
  final Function(String) onchage;
  final TextInputType keyboard;
  final String Function(String) validator;
  CustomTextField(
      {@required this.hintTextInput,
      @required this.onchage,
      this.keyboard: TextInputType.name,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboard,
        onChanged: onchage,
        decoration: InputDecoration(
          hintText: hintTextInput,
        ),
      ),
    );
  }
}
