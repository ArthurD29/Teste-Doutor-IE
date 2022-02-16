import 'package:app/app/shared/status/form_submission_status.dart';

class RegisterState {
  final String name;
  bool get isValidName => name.length > 1;

  final String description;
  bool get isValidDescription => description.length > 1;

  final String value;
  bool get isValidValue => value.length > 1;

  final FormSubmissionStatus formStatus;

  RegisterState({
    this.name = "",
    this.description = "",
    this.value = "",
    this.formStatus = const InitialFormStatus(),
  });

  RegisterState copyWith({
    String? name,
    String? description,
    String? value,
    FormSubmissionStatus? formStatus,
  }) {
    return RegisterState(
      name: name ?? this.name,
      description: description ?? this.description,
      value: value ?? this.value,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
