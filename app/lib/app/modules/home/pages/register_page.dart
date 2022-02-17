import 'package:app/app/shared/bloc/register_bloc.dart';
import 'package:app/app/shared/core/app_colors.dart';
import 'package:app/app/shared/core/app_fonts.dart';
import 'package:app/app/shared/events/register_event.dart';
import 'package:app/app/shared/repositories/auth_repository.dart';
import 'package:app/app/shared/states/register_state.dart';
import 'package:app/app/shared/status/form_submission_status.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cadastro de Produtos',
            style:
                AppFonts.title.copyWith(fontSize: 20, color: AppColors.primary),
          )),
      body: BlocProvider(
        create: (context) => RegisterBloc(
          authRepo: context.read<AuthRepository>(),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _registerForm(),
                SizedBox(
                  height: 20,
                ),
                _registerButton(),
              ],
            ),
          ),
        ),
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
        child: Container(
          height: 320,
          width: 320,
          decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: new BorderRadius.all(
                Radius.circular(40.0),
              )),
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.store,
                    size: 40,
                    color: AppColors.primary,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _nameField(),
                  _descriptionField(),
                  _valueField(),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _nameField() {
    return BlocBuilder<RegisterBloc, RegisterState>(builder: (context, state) {
      return TextFormField(
        style: AppFonts.title.copyWith(fontSize: 16, color: AppColors.white),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          ),
          icon: FaIcon(
            FontAwesomeIcons.featherAlt,
            color: AppColors.primary,
          ),
          hintText: 'Nome',
          hintStyle:
              AppFonts.subtitle.copyWith(fontSize: 16, color: AppColors.white),
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
        style: AppFonts.title.copyWith(fontSize: 16, color: AppColors.white),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          ),
          icon: FaIcon(
            FontAwesomeIcons.solidComment,
            color: AppColors.primary,
          ),
          hintText: 'Descrição',
          hintStyle:
              AppFonts.subtitle.copyWith(fontSize: 16, color: AppColors.white),
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
        keyboardType: TextInputType.numberWithOptions(),
        style: AppFonts.title.copyWith(fontSize: 16, color: AppColors.white),
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.white),
          ),
          icon: FaIcon(
            FontAwesomeIcons.donate,
            color: AppColors.primary,
          ),
          hintText: 'Valor',
          hintStyle:
              AppFonts.subtitle.copyWith(fontSize: 16, color: AppColors.white),
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
              style: ElevatedButton.styleFrom(
                  fixedSize: const Size(200, 50), primary: AppColors.black),
              child: Text(
                'Enviar',
                style: AppFonts.title.copyWith(color: AppColors.white),
              ),
            );
    });
  }
}
