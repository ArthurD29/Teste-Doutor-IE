import 'package:app/app/shared/events/register_event.dart';
import 'package:app/app/shared/repositories/auth_repository.dart';
import 'package:app/app/shared/states/register_state.dart';
import 'package:app/app/shared/status/form_submission_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository? authRepo;

  Map<String, dynamic> data = {};

  RegisterBloc({this.authRepo}) : super(RegisterState()) {
    on<RegisterNameChanged>((event, emit) {
      emit(state.copyWith(name: event.name));
      data.addAll({"name": event.name});
    });
    on<RegisterDescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
      data.addAll({"description": event.description});
    });
    on<RegisterValueChanged>((event, emit) {
      emit(state.copyWith(value: event.value));
      data.addAll({"value": event.value});
    });
    on<RegisterSubmitted>((event, emit) async {
      emit(state.copyWith(formStatus: FormSubmitting()));
      try {
        final message = await authRepo!.register(data);
        emit(state.copyWith(formStatus: SubmissionSuccess(message: message)));
      } catch (e) {
        emit(state.copyWith(
            formStatus: SubmissionFailed(exception: e.toString())));
      }
    });
  }
}
