import 'package:formz/formz.dart';

enum PortValidationError { invalid }

class Port extends FormzInput<int, PortValidationError> {
  const Port.pure() : super.pure(-1);
  const Port.dirty([int value = -1]) : super.dirty(value);

  @override
  PortValidationError validator(int value) {
    return 0 <= value && value <= 65535 ? null : PortValidationError.invalid;
  }
}
