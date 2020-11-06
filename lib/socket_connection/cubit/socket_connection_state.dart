part of 'socket_connection_cubit.dart';

class SocketConnectionState extends Equatable {
  final IPv4 ipv4;
  final FormzStatus status;

  const SocketConnectionState(
      {this.ipv4 = const IPv4.pure(), this.status = FormzStatus.pure});

  SocketConnectionState copyWith({
    IPv4 ipv4,
    FormzStatus status,
  }) {
    return SocketConnectionState(
        ipv4: ipv4 ?? this.ipv4, status: status ?? this.status);
  }

  @override
  List<Object> get props => [ipv4, status];
}
