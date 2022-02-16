import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Produtos')),
      body: _registerForm(),
    );
  }

  Widget _registerForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _nameField(),
            _descriptionField(),
            _valueField(),
            SizedBox(
              height: 8,
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }

  Widget _nameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Nome",
        icon: Icon(Icons.person),
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) return 'Este campo precisa ser preenchido!';
        return null;
      },
    );
  }

  Widget _descriptionField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Descrição",
        icon: Icon(Icons.message),
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) return 'Este campo precisa ser preenchido!';
        return null;
      },
    );
  }

  Widget _valueField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Valor",
        icon: Icon(Icons.money_rounded),
      ),
      validator: (value) {
        if (value?.isEmpty ?? true) return 'Este campo precisa ser preenchido!';
        return null;
      },
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Enviar"),
    );
  }
}
