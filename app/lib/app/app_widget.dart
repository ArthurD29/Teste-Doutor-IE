import 'package:app/app/pages/register_page.dart';
import 'package:app/app/shared/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: RegisterPage(),
      ),
      builder: asuka.builder,
    );
  }
}
