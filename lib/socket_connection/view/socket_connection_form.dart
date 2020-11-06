import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:esp32_wifi_controller/socket_connection/socket_connection.dart';

class SocketConnectionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<SocketConnectionCubit, SocketConnectionState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Connection Failure')),
            );
        }
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
      buildWhen: (previous, current) => previous.port != current.port,
      builder: (context, state) {
        return TextField(
          onChanged: (port) => context
              .bloc<SocketConnectionCubit>()
              .portChanged(int.parse(port)),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Port',
            helperText: '',
            errorText: state.port.invalid ? 'ex) 80' : null,
          ),
        );
      },
    );
  }
}

class _ConnectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocketConnectionCubit, SocketConnectionState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : RaisedButton(
                child: const Text("Connect"),
                onPressed: state.status.isValidated
                    ? () => context.bloc<SocketConnectionCubit>().connect()
                    : null,
              );
      },
    );
  }
}
