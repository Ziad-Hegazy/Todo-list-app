import 'package:Todo_list_app/models/task.dart';
import 'package:Todo_list_app/models/todo.dart';
import 'package:flutter/material.dart';
import '../styles/theme.dart';
import '../views/todo_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Todo>('Todo');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: AppTheme.main, home: TodoScreen());
  }
}
