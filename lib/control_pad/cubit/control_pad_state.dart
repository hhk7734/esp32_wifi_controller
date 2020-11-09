part of 'control_pad_cubit.dart';

abstract class ControlPadState extends Equatable {
  const ControlPadState();

  @override
  List<Object> get props => [];
}

class ControlPadInitial extends ControlPadState {}

class ControlPadDisconnectSuccess extends ControlPadState {}
