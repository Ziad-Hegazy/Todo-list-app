import 'package:Todo_list_app/extensions/date.dart';
import 'package:Todo_list_app/styles/font.dart';
import 'package:Todo_list_app/widgets/task_item.dart';
import 'package:flutter/material.dart';
import '/models/todo.dart';

class TodoItemWidget extends StatefulWidget {
  const TodoItemWidget({
    required Key key,
    required this.todo,
    required this.onDelete,
    required this.onToggleCompleted,
    required this.onUpdate,
  }):super(key: key);
  
  final Todo todo;
  final VoidCallback onDelete;
  final VoidCallback onToggleCompleted;
  final Function(Todo) onUpdate;

  @override
  State<TodoItemWidget> createState() => _TodoItemWidgetState(
        todo: todo,
        onDelete: onDelete,
        onToggleCompleted: onToggleCompleted,
        onUpdate: onUpdate,
      );
}

class _TodoItemWidgetState extends State<TodoItemWidget> {
  final Todo todo;
  final VoidCallback onDelete;
  final VoidCallback onToggleCompleted;
  final Function(Todo) onUpdate;

  _TodoItemWidgetState(
      {required this.todo,
      required this.onDelete,
      required this.onToggleCompleted,
      required this.onUpdate});

  String completed() {
    if (todo.countCompleted() == todo.tasks.length) {
      return "Completed";
    } else {
      return todo.countCompleted().toString() +
          '/' +
          todo.tasks.length.toString() +
          ' Tasks completed';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        controlAffinity: ListTileControlAffinity.trailing,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(todo.dateTime.timeOnly(),
                style: AppTextStyles.todo),
            Text(
              completed(),
              style: AppTextStyles.counter.copyWith(
                  color: todo.countCompleted() == todo.tasks.length
                      ? Colors.greenAccent
                      : Colors.amber),
            ),
          ],
        ),
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: todo.tasks.length,
              itemBuilder: (context, index) {
                final task = todo.tasks[index];
                return TaskItem(
                  task: task,
                  onDelete: () {
                    todo.deleteTask(task);
                    setState(() {});
                  },
                  onToggleCompleted: () {
                    todo.toggleComplete(task);
                    setState(() {});
                  },
                  onUpdate: (updatedTask) {
                    todo.updateTask(updatedTask);
                    setState(() {});
                  },
                );
              })
        ],
      ),
    );
  }
}
