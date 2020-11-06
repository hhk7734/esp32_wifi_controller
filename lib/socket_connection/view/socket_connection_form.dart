import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:esp32_wifi_controller/socket_connection/socket_connection.dart';

class SocketConnectionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SocketConnectionCubit, SocketConnectionState>(
      listener: (context, state) {
        // TODO
      },
      child: Column(
        children: [
          _IpInput(),
          const SizedBox(
            height: 10,
          ),
          _PortInput(),
          const SizedBox(
            height: 10,
          ),
          _ConnectButton(),
        ],
      ),
    );
  }
}

class _IpInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocketConnectionCubit, SocketConnectionState>(
      builder: (context, state) {
        return TextField();
      },
    );
  }
}

class _PortInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocketConnectionCubit, SocketConnectionState>(
      builder: (context, state) {
        return TextField();
      },
    );
  }
}

class _ConnectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocketConnectionCubit, SocketConnectionState>(
      builder: (context, state) {
        return RaisedButton(
          child: const Text("Connect"),
          onPressed: null,
        );
      },
    );
  }
}
