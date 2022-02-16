import 'package:app/app/modules/bloc/auth_repository.dart';
import 'package:app/app/modules/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 300,
                width: 300,
                child: Image.asset("assets/images/logo.png")),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => RepositoryProvider(
                    create: (context) => AuthRepository(),
                    child: RegisterPage(),
                  ),
                ),
              );
            },
            child: Text('Cadastrar Produto'),
          ),
        ],
      ),
    );
  }
}
