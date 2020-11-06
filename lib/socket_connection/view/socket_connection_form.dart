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
          _IPv4Input(),
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

class _IPv4Input extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocketConnectionCubit, SocketConnectionState>(
      buildWhen: (previous, current) => previous.ipv4 != current.ipv4,
      builder: (context, state) {
        return TextField(
          onChanged: (ipv4) =>
              context.bloc<SocketConnectionCubit>().ipv4Changed(ipv4),
          keyboardType: TextInputType.url,
          decoration: InputDecoration(
            labelText: 'IPv4',
            helperText: '',
            errorText: state.ipv4.invalid ? 'ex) 192.168.4.1' : null,
          ),
        );
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