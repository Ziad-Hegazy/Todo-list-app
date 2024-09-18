
import 'task.dart';

class Todo {
  String id;
  String timeString;
  DateTime dateTime;
  bool isCompleted;
  List<Task> tasks = [];

  Todo(
      {required this.id,
      required this.timeString,
      required this.dateTime,
      this.isCompleted = false,});

  void addTask(Task task) {
    tasks.add(task);
  }
  int countCompleted(){
    return tasks.where((t) => t.isCompleted).length;
  }
  void updateTask(Task task) {
    int index = tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      tasks[index] = task;
    }
  }

  void deleteTask(Task task) {
    tasks.removeWhere((t) => t.id == task.id);
  }

  void toggleComplete(Task task) {
    task.isCompleted = !task.isCompleted;
  }
}
