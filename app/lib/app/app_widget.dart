import 'package:app/app/modules/home/pages/start_page.dart';
import 'package:app/app/shared/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teste Flutter Doutor-IE",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: AppColors.primary,
      ),
      home: StartPage(),
      builder: asuka.builder,
    );
  }
}
