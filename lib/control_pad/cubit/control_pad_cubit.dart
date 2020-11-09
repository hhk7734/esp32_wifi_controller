import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:esp32_repository/esp32_repository.dart';

part 'control_pad_state.dart';

class ControlPadCubit extends Cubit<ControlPadState> {
  final Esp32Repository _esp32Repository;
  StreamSubscription<Esp32Status> _esp32StatusStreamSubscription;
  Timer _connectionTimer;

  ControlPadCubit({Esp32Repository esp32Repository})
      : _esp32Repository = esp32Repository,
        super(ControlPadInitial()) {
    _esp32StatusStreamSubscription = _esp32Repository.status.listen((status) {
      switch (status) {
        case Esp32Status.disconnected:
          emit(ControlPadDisconnectSuccess());
          break;
        default:
      }
    });
  }

  void disconnect() {
    _esp32Repository.disconnect();
  }

  void timerStart() {
    _connectionTimer =
        Timer.periodic(Duration(milliseconds: 800), (timer) async {
      await write("0\r\n");
    });
  }

  void timerStop() {
    _connectionTimer?.cancel();
  }

  Future<void> write(data) async {
    await _esp32Repository.write(data);
  }

  @override
  Future<void> close() async {
    await _esp32StatusStreamSubscription?.cancel();
    return super.close();
  }
}
