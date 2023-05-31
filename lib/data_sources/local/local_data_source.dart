import '../../model/user.dart';

class LocalDataSource {
  List<User> users = [
    User(
      id: '1',
      name: 'local Avend',
      date: '22/05/2000',
      time: '10/15',
    ),
    User(
      id: '2',
      name: 'local Arvin',
      date: '21/01/2001',
      time: '1015',
    ),
  ];

  bool addUser(User user) {
    users.add(user);
    return true;
  }

  List<User> getUser() {
    return users;
  }
}
