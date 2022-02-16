import 'package:app/app/shared/form_submission_status.dart';

class RegisterState {
  final String name;
  final String description;
  final String value;
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
