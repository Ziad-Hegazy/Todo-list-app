

class Task {
  int id;
  String description;
  bool isCompleted;
  Task({
    required this.id,
    required this.description,
    this.isCompleted=false,
  });
}
