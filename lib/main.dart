import 'package:flutter/material.dart';
import 'package:Todo_list_app/styles/theme.dart';
import 'package:Todo_list_app/views/todo_screen.dart';

void main(List<String> args) {
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
