part of 'socket_connection_cubit.dart';

abstract class SocketConnectionState extends Equatable {
  const SocketConnectionState();

  @override
  List<Object> get props => [];
}

class SocketConnectionInitial extends SocketConnectionState {}
