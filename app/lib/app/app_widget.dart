import 'package:app/app/modules/pages/start_page.dart';
import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFff6600),
      ),
      home: StartPage(),
      builder: asuka.builder,
    );
  }
}
