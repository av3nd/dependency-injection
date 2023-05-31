import 'package:dependency_injection/view/add_user_view.dart';
import 'package:dependency_injection/view/display_user_view.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AddUserView(),
        '/displayUserRoute': (context) => const DisplayUserView(),
      },
    );
  }
}
