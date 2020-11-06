import 'package:formz/formz.dart';

enum IPv4ValidationError { invalid }

class IPv4 extends FormzInput<String, IPv4ValidationError> {
  const IPv4.pure() : super.pure('');
  const IPv4.dirty([String value = '']) : super.dirty(value);

  static final RegExp _ipv4RegExp = RegExp(
      r"^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])$");

  @override
  IPv4ValidationError validator(String value) {
    return _ipv4RegExp.hasMatch(value) ? null : IPv4ValidationError.invalid;
  }
}
