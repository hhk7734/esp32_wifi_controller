import 'dart:async';
import 'dart:io';

import 'package:meta/meta.dart';

enum Esp32Status { unknown, connected, disconnected }

class Esp32Repository {
  final _controller = StreamController<Esp32Status>.broadcast();
  Socket _clientSocket = null;

  Stream<Esp32Status> get status async* {
    if (_clientSocket == null) {
      yield Esp32Status.disconnected;
    } else {
      yield Esp32Status.connected;
    }
    yield* _controller.stream;
  }

  Future<bool> connect({@required String ip, @required int port}) async {
    try {
      _clientSocket =
          await Socket.connect(ip, port, timeout: Duration(seconds: 2));
      _clientSocket.listen(
        (data) => print("data: $data"),
        onError: (e) => print("error: $e"),
        onDone: () => _disconnect(),
      );
      _controller.add(Esp32Status.connected);
      return true;
    } on Exception {
      _clientSocket = null;
      return false;
    }
  }

  void disconnect() {
    _clientSocket?.destroy();
  }

  void _disconnect() {
    _clientSocket?.destroy();
    _clientSocket = null;
    _controller.add(Esp32Status.disconnected);
  }

  Future<void> write(data) async {
    _clientSocket.write(data);
    await _clientSocket.flush();
  }

  void dispose() {
    _clientSocket?.destroy();
    _controller.close();
  }
}
