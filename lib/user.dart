class User {
  final String id;
  final String name;
  final String email;
  final int age;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });
}

final userList = List.generate(
  20,
  (index) => User(
    id: index.toString(),
    name: 'User$index',
    email: 'user$index@example.com',
    age: index,
  ),
);
