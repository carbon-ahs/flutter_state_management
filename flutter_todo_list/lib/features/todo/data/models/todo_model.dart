class Todo {
  final String name;
  final DateTime createdAt;

  Todo({required this.name, required this.createdAt});

  // toString
  @override
  String toString() {
    return 'Todo(name: $name, createdAt: $createdAt)';
  }
}
