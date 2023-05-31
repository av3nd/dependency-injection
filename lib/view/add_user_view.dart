import 'package:dependency_injection/model/user.dart';
import 'package:flutter/material.dart';

import '../di/di.dart';
import '../repository/user_repository.dart';

class AddUserView extends StatefulWidget {
  const AddUserView({super.key});

  @override
  State<AddUserView> createState() => _AddUserViewState();
}

class _AddUserViewState extends State<AddUserView> {
  TimeOfDay time = TimeOfDay.now();
  DateTime date = DateTime.now();
  final idController = TextEditingController();
  final nameController = TextEditingController();
  var gap = const SizedBox(height: 20);
  var gap2 = const SizedBox(width: 20);
  // final meroKey = GlobalKey<FormState>();
  UserRepository userRepository = getIt();

  void addUser() {
    User user = User(
        id: idController.text,
        name: nameController.text,
        date: '${date.day}/${date.month}/${date.year}',
        time: '${time.hour}:${time.minute}');
    userRepository.addUser(user);

    setState(() {
      userRepository.addUser(user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add User'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: 'Id',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 120, 120, 120),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                gap,
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 120, 120, 120),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Text(
                        'Select Date of Birth',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      gap2,
                      ElevatedButton(
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2024),
                          );
                          if (newDate != null) {
                            setState(() {
                              date = newDate;
                            });
                          }
                        },
                        child: const Text('Change Date'),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '  Date: ${date.day}/${date.month}/${date.year}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Text(
                        'Select Time of Birth',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      gap2,
                      ElevatedButton(
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: time,
                          );
                          if (newTime != null) {
                            setState(() {
                              time = newTime;
                            });
                          }
                        },
                        child: const Text("Select Time"),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '  Time: ${time.hour}:${time.minute}',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('Add  User'),
                    onPressed: () {
                      // if (meroKey.currentState!.validate()) {
                      addUser();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('User added successfully'),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      // }
                    },
                  ),
                ),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('View  User'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/displayUserRoute',
                          arguments: userRepository);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
