import 'package:flutter/material.dart';
import 'package:flutter_status_notification_alert/flutter_status_notification_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: DemoPage());
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  void showAlerts(BuildContext context) {
    StatusAlert.show(
      context,
      text: "Success Alert",
      type: StatusType.success,
      duration: Duration(seconds: 3),
      position: StatusPosition.top,

    );

    StatusAlert.show(
      context,
      text: "Error Alert",
      type: StatusType.error,
      position: StatusPosition.top,
      duration: Duration(seconds: 3),
    );

    StatusAlert.show(
      context,
      text: "Warning Alert",
      type: StatusType.warning,
      duration: Duration(seconds: 4),
      position: StatusPosition.top,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Status Alert Demo")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showAlerts(context),
          child: const Text("Show Alerts"),
        ),
      ),
    );
  }
}
