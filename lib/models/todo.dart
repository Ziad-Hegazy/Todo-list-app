import 'package:hive/hive.dart';
import 'task.dart';
part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String timeString;

  @HiveField(2)
  DateTime dateTime;

  @HiveField(3)
  bool isCompleted;

  @HiveField(4)
  List<Task> tasks = [];

  Todo({
    required this.id,
    required this.timeString,
    required this.dateTime,
    this.isCompleted = false,
  });
}
