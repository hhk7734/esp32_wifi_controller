import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:esp32_repository/esp32_repository.dart';

part 'socket_connection_state.dart';

class SocketConnectionCubit extends Cubit<SocketConnectionState> {
  final Esp32Repository _esp32Repository;

  SocketConnectionCubit({Esp32Repository esp32Repository})
      : _esp32Repository = esp32Repository,
        super(SocketConnectionInitial());
}
