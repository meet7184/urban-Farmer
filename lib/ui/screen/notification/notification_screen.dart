import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName = 'notificationScreen';
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: 200),
          Center(
              child: Text(
            "Notification",
            style: TextStyle(fontSize: 40),
          )),
        ],
      )),
    );
  }
}
