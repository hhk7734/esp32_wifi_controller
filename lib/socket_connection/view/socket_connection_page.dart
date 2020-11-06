import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:esp32_wifi_controller/socket_connection/socket_connection.dart';

class SocketConnectionPage extends StatelessWidget {
  const SocketConnectionPage({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => const SocketConnectionPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connection"),
      ),
      body: BlocProvider(
        create: (_) => SocketConnectionCubit(),
        child: SocketConnectionForm(),
      ),
    );
  }
}
