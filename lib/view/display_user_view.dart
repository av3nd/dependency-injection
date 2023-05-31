import 'package:flutter/material.dart';
import '../di/di.dart';
import '../repository/user_repository.dart';

class DisplayUserView extends StatefulWidget {
  const DisplayUserView({super.key});

  @override
  State<DisplayUserView> createState() => _DisplayUserViewState();
}

class _DisplayUserViewState extends State<DisplayUserView> {
  UserRepository userRepository = getIt<UserRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display User'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          '${userRepository.getUsers()}',
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
