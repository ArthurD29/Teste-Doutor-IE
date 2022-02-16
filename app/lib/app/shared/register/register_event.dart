abstract class RegisterEvent {}

class RegisterNameChanged extends RegisterEvent {
  final String name;

  RegisterNameChanged({
    required this.name,
  });
}

class RegisterDescriptionChanged extends RegisterEvent {
  final String description;

  RegisterDescriptionChanged({
    required this.description,
  });
}

class RegisterValueChanged extends RegisterEvent {
  final String value;

  RegisterValueChanged({
    required this.value,
  });
}

class RegisterSubmitted extends RegisterEvent {}
