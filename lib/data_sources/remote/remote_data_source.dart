import '../../model/user.dart';

class RemoteDataSource {
  List<User> users = [
    User(
      id: '1',
      name: 'Remote Avemd',
      date: '21/01/2001',
      time: '10/15',
    ),
    User(
      id: '2',
      name: 'Remote Arvin',
      date: '21/01/2001',
      time: '10/15',
    ),
    User(
      id: '3',
      name: 'Remote Anish',
      date: '21/01/2001',
      time: '10/15',
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
