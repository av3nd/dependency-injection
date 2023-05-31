class User {
  final String id;
  final String name;
  final String time;
  final String date;

  User({
    required this.id,
    required this.name,
    required this.date,
    required this.time,
  });

  @override
  String toString() {
    return 'User(id: $id, name: $name, Date: $date, Time: $time)';
  }
}
