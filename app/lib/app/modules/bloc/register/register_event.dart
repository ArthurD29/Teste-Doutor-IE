abstract class RegisterEvent {}

class RegisterNameChanged extends RegisterEvent {
  final String? name;

  RegisterNameChanged({
    this.name,
  });
}

class RegisterDescriptionChanged extends RegisterEvent {
  final String? description;

  RegisterDescriptionChanged({
    this.description,
  });
}

class RegisterValueChanged extends RegisterEvent {
  final String? value;

  RegisterValueChanged({
    this.value,
  });
}

class RegisterSubmitted extends RegisterEvent {}
