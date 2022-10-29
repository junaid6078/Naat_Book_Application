import 'package:flutter/material.dart';

class AppNavigator {
  static void toHome(BuildContext context) {
    close(context);
    Navigator.pushNamed(context, "/app");
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
