part of 'socket_connection_cubit.dart';

class SocketConnectionState extends Equatable {
  final IPv4 ipv4;
  final Port port;
  final FormzStatus status;

  const SocketConnectionState(
      {this.ipv4 = const IPv4.pure(),
      this.port = const Port.pure(),
      this.status = FormzStatus.pure});

  SocketConnectionState copyWith({
    IPv4 ipv4,
    Port port,
    FormzStatus status,
  }) {
    return SocketConnectionState(
        ipv4: ipv4 ?? this.ipv4,
        port: port ?? this.port,
        status: status ?? this.status);
  }

  @override
  List<Object> get props => [ipv4, port, status];
}
