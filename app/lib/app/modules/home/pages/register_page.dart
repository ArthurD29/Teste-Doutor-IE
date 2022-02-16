import 'package:app/app/shared/bloc/register_bloc.dart';
import 'package:app/app/shared/events/register_event.dart';
import 'package:app/app/shared/repositories/auth_repository.dart';
import 'package:app/app/shared/states/register_state.dart';
import 'package:app/app/shared/status/form_submission_status.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocProvider(
        create: (context) => RegisterBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: _registerForm(),
      ),
    );
  }

  Widget _registerForm() {
    return BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          final formStatus = state.formStatus;
          if (formStatus is SubmissionFailed) {
            AsukaSnackbar.alert(formStatus.exception).show();
          } else if (formStatus is SubmissionSuccess) {
            AsukaSnackbar.success(formStatus.message).show();
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _nameField(),
                _descriptionField(),
                _valueField(),
                SizedBox(
                  height: 8,
                ),
                _registerButton(),
              ],
            ),
          ),
        ));
  }

  Widget _nameField() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Nome',
        ),
        validator: (value) =>
            state.isValidName ? null : 'Este campo precisa ser preenchido!',
        onChanged: (value) => context.read<RegisterBloc>().add(
              RegisterNameChanged(name: value),
            ),
      );
    });
  }

  Widget _descriptionField() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.message),
          hintText: 'Descrição',
        ),
        validator: (value) => state.isValidDescription
            ? null
            : 'Este campo precisa ser preenchido!',
        onChanged: (value) => context.read<RegisterBloc>().add(
              RegisterDescriptionChanged(description: value),
            ),
      );
    });
  }

  Widget _valueField() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.money_rounded),
          hintText: 'Valor',
        ),
        validator: (value) =>
            state.isValidValue ? null : 'Este campo precisa ser preenchido!',
        onChanged: (value) => context.read<RegisterBloc>().add(
              RegisterValueChanged(value: value),
            ),
      );
    });
  }

  Widget _registerButton() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<RegisterBloc>().add(RegisterSubmitted());
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
              child: Text('Enviar'),
            );
    });
  }
}
