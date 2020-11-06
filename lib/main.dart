import 'package:flutter/widgets.dart';
import 'package:esp32_repository/esp32_repository.dart';
import 'package:esp32_wifi_controller/app.dart';

void main() {
  runApp(App(esp32Repository: Esp32Repository()));
}
