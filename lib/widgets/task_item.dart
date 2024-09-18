import 'package:Todo_list_app/styles/font.dart';
import 'package:flutter/material.dart';
import '/models/task.dart';
//import '/utils/app_styles.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggleCompleted,
    required this.onUpdate,
  });
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onToggleCompleted;
  final Function(Task) onUpdate;

  @override
  State<TaskItem> createState() => _TaskItemState(
        task: task,
        onDelete: onDelete,
        onToggleCompleted: onToggleCompleted,
        onUpdate: onUpdate,
      );
}

class _TaskItemState extends State<TaskItem> {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onToggleCompleted;
  final Function(Task) onUpdate;

  _TaskItemState(
      {required this.task,
      required this.onDelete,
      required this.onToggleCompleted,
      required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            IconButton(
              onPressed: onToggleCompleted,
              icon: Icon(task.isCompleted
                  ? Icons.check_box
                  : Icons.check_box_outline_blank),
              color: Colors.greenAccent,
              iconSize: 20,
            ),
            Text(task.description,
                style: task.isCompleted
                    ? AppTextStyles.completedTask
                    : AppTextStyles.task),
          ]),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.orange,
                  ),
                  iconSize: 20,
                  onPressed: () {
                    _showEditTaskDialog(context, task);
                  }),
              IconButton(
                  onPressed: onDelete,
                  iconSize: 20,
                  icon: const Icon(Icons.delete)),
            ],
          )
        ],
      ),
    );
  }

  void _showEditTaskDialog(BuildContext context, Task task) {
    TextEditingController descriptionController =
        TextEditingController(text: task.description);

    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("Edit Todo"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(labelText: "Description"),
                    controller: descriptionController,
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Task updatedTask = Task(
                          id: task.id,
                          description: descriptionController.text,
                          isCompleted: task.isCompleted);
                      onUpdate(updatedTask);
                      setState(() {
                        onUpdate(updatedTask);
                      });
                      onUpdate(updatedTask);
                      Navigator.pop(context);
                    },
                    child: const Text("Update"))
              ],
            ));
  }
}
