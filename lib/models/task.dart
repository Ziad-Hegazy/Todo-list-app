import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String description;

  @HiveField(2)
  bool isCompleted;

  Task({
    required this.id,
    required this.description,
    this.isCompleted = false,
  });
}
