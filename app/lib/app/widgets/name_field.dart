import 'package:flutter/material.dart';

class NameField extends StatefulWidget {
  @override
  _NameFieldState createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: "Nome"),
    );
  }
}
