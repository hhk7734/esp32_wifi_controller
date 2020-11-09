import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:esp32_repository/esp32_repository.dart';

import 'package:esp32_wifi_controller/control_pad/control_pad.dart';

class ControlPadPage extends StatelessWidget {
  const ControlPadPage({Key key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(builder: (_) => const ControlPadPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ControlPadCubit(
            esp32Repository: RepositoryProvider.of<Esp32Repository>(context)),
        child: BlocConsumer<ControlPadCubit, ControlPadState>(
          listener: (context, state) {
            if (state is ControlPadDisconnectSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return WillPopScope(
              child: Scaffold(
                body: SafeArea(
                  child: Text("hi"),
                ),
              ),
              onWillPop: () async {
                BlocProvider.of<ControlPadCubit>(context).disconnect();
                return false;
              },
            );
          },
        ));
  }
}
