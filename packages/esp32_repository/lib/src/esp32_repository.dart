import 'dart:async';
import 'dart:io';

import 'package:meta/meta.dart';

enum Esp32Status { unknown, connected, disconnected }

class Esp32Repository {
  final _controller = StreamController<Esp32Status>();
  Socket _clientSocket;

  Stream<Esp32Status> get status async* {
    // TODO
    yield Esp32Status.disconnected;
    yield* _controller.stream;
  }

  Future<void> connect({@required String ip, @required int port}) async {
    _clientSocket =
        await Socket.connect(ip, port, timeout: Duration(seconds: 2));
    _controller.add(Esp32Status.connected);
  }

  void disconnect() {
    // TODO
    _controller.add(Esp32Status.disconnected);
  }

  void dispose() {
    _controller.close();
  }
}
