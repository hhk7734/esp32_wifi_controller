import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esp32_repository/esp32_repository.dart';
import 'package:formz/formz.dart';

import 'package:esp32_wifi_controller/socket_connection/socket_connection.dart';

part 'socket_connection_state.dart';

class SocketConnectionCubit extends Cubit<SocketConnectionState> {
  final Esp32Repository _esp32Repository;

  SocketConnectionCubit({Esp32Repository esp32Repository})
      : _esp32Repository = esp32Repository,
        super(SocketConnectionState());

  void ipv4Changed(String value) {
    final ipv4 = IPv4.dirty(value);
    emit(
        state.copyWith(ipv4: ipv4, status: Formz.validate([ipv4, state.port])));
  }

  void portChanged(int value) {
    final port = Port.dirty(value);
    emit(
        state.copyWith(port: port, status: Formz.validate([state.ipv4, port])));
  }

  Future<void> connect() async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    if (await _esp32Repository.connect(
        ip: state.ipv4.value, port: state.port.value)) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } else {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
