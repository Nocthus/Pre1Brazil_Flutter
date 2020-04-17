import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({this.labelText, this.onChanged, this.errorText});

  final labelText;
  final onChanged;
  final String Function() errorText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }
}
