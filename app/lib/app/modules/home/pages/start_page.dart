import 'package:app/app/modules/home/pages/register_page.dart';
import 'package:app/app/shared/core/app_colors.dart';
import 'package:app/app/shared/core/app_fonts.dart';
import 'package:app/app/shared/repositories/auth_repository.dart';
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
          Text(
            'Teste Fluter Doutor-IE',
            style: AppFonts.title.copyWith(color: AppColors.black),
          ),
          Center(
            child: Container(
                height: 300,
                width: 300,
                child: Image.asset("assets/images/logo.png")),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RepositoryProvider(
                    create: (context) => AuthRepository(),
                    child: RegisterPage(),
                  ),
                ),
              );
            },
            child: Text(
              'Cadastrar Produto',
              style: AppFonts.title.copyWith(
                color: AppColors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
                fixedSize: const Size(200, 50), primary: AppColors.black),
          ),
        ],
      ),
    );
  }
}
