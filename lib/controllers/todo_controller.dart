import 'package:Todo_list_app/models/task.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../extensions/date.dart';

import '../models/todo.dart';

class TodoController {
  List<Todo> todos = [];
  Box<Todo> todoBox = Hive.box<Todo>('Todo');

  List<Todo> filteredTodos(DateTime dateTime) {
    dateTime.dateOnly();
    return todoBox.values
        .toList()
        .where((t) => t.dateTime.dateOnly() == dateTime)
        .toList();
  }

  Future<void> addTodo(Todo todo) async {
    await todoBox.add(todo);
  }

  Future<void> updateTodo(Todo todo) async {
    await todo.save();
    // int index = todos.indexWhere((t) => t.id == todo.id);
    // if (index != -1) {
    //   todos[index] = todo;
    // }
  }

  Future<void> deleteTodo(Todo todo) async {
    await todo.delete();
    // todos.removeWhere((t) => t.id == todo.id);
  }

  Future<void> toggleComplete(Todo todo) async {
    todo.isCompleted = !todo.isCompleted;
    await todo.save();
  }

  // void addTask(Todo todo, Task task) {
  //   todo.tasks.add(task);
  // }

  int countCompleted(Todo todo) {
    return todo.tasks.where((t) => t.isCompleted).length;
  }

  Future<void> updateTask(Todo todo, Task task) async {
    int index = todo.tasks.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      todo.tasks[index] = task;
    }
    await todo.save();
  }

  Future<void> deleteTask(Todo todo, Task task) async {
    todo.tasks.removeWhere((t) => t.id == task.id);
    await todo.save();
  }

  Future<void> taskToggleComplete(Todo todo, Task task) async {
    task.isCompleted = !task.isCompleted;
    await updateTask(todo, task);
  }
}
