import 'package:dependency_injection/app.dart';
import 'package:flutter/material.dart';
import 'di/di.dart';

void main(List<String> args) {
  initModule();

  runApp(
    const App(),
  );
}
