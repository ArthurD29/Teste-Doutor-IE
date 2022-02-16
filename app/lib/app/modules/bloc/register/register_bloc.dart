import 'package:app/app/modules/bloc/auth_repository.dart';
import 'package:app/app/modules/bloc/form_submission_status.dart';
import 'package:app/app/modules/bloc/register/register_event.dart';
import 'package:app/app/modules/bloc/register/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository? authRepo;

  RegisterBloc({this.authRepo}) : super(RegisterState()) {
    on<RegisterNameChanged>(
        (event, emit) => emit(state.copyWith(name: event.name)));
    on<RegisterDescriptionChanged>(
        (event, emit) => emit(state.copyWith(description: event.description)));
    on<RegisterValueChanged>(
        (event, emit) => emit(state.copyWith(value: event.value)));
    on<RegisterSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        await authRepo!.register();
        emit(state.copyWith(formStatus: SubmissionSuccess()));
      } catch (e) {
        emit(state.copyWith(
            formStatus: SubmissionFailed(exception: Exception(e))));
      }
    });
  }
}
