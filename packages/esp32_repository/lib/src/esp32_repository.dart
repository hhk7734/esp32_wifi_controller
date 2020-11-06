import 'dart:async';

import 'package:meta/meta.dart';

enum Esp32Status { unknown, connected, disconnected }

class Esp32Repository {
  final _controller = StreamController<Esp32Status>();

  Stream<Esp32Status> get status async* {
    // TODO
    yield Esp32Status.disconnected;
    yield* _controller.stream;
  }

  Future<void> connect({@required String ip, @required int port}) async {
    // TODO
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
