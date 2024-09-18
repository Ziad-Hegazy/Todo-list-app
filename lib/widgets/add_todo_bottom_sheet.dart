import 'package:Todo_list_app/extensions/date.dart';
import 'package:Todo_list_app/models/task.dart';
import 'package:Todo_list_app/styles/colors.dart';
import 'package:Todo_list_app/styles/font.dart';
import 'package:flutter/material.dart';

import '../models/todo.dart';

class AddTodoBottomSheet extends StatefulWidget {
  final Function(Todo) onAdd;
  DateTime dateTime;
  AddTodoBottomSheet({super.key, required this.onAdd, required this.dateTime});

  @override
  State<AddTodoBottomSheet> createState() =>
      _AddTodoBottomSheetState(dateTime: dateTime);
}

class _AddTodoBottomSheetState extends State<AddTodoBottomSheet> {
  final TextEditingController _descriptionController = TextEditingController();
  _AddTodoBottomSheetState({required this.dateTime});
  DateTime? dateTime;
  List<Task> tasks = [];
  int taskId = 1;

  void _selectTime() async {
    TimeOfDay time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(dateTime!),
        ) ??
        TimeOfDay.fromDateTime(dateTime!);
    dateTime = dateTime!.merged(time);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Task',
            style: AppTextStyles.title,
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Time',
                style: AppTextStyles.sheetSubtitles,
              ),
              SizedBox(width: 15),
              TextButton(
                onPressed: () {
                  _selectTime();
                },
                child: SizedBox(
                  height: 30,
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.schedule_rounded),
                      SizedBox(width: 5),
                      Text(dateTime!.timeOnly())
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Enter Description")),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Task task =
                    Task(id: taskId, description: _descriptionController.text);
                tasks.add(task);
                taskId++;
                setState(() {});
              },
              child: Icon(Icons.add_rounded)),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            child: Container(
              //padding: EdgeInsets.only(left:35,right:35,bottom: MediaQuery.of(context).viewInsets.bottom),
              constraints: BoxConstraints(maxHeight: 193,),
              child: ListView.builder(
                  //reverse: true,
                  //padding: EdgeInsets.only(left:35,right:35,bottom: MediaQuery.of(context).viewInsets.bottom),
                  shrinkWrap: true,
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return Text(
                      task.description,
                      style:
                          AppTextStyles.sheetTasks,
                    );
                  }),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Todo newTodo = Todo(
                  id: dateTime.toString(),
                  timeString: dateTime!.timeOnly(),
                  //description: _descriptionController.text;
                  dateTime: dateTime!,
                );
                newTodo.tasks = tasks;
                widget.onAdd(newTodo);
                Navigator.pop(context);
                //Navigator.of(context).pop();
              },
              child: const Text("Confirm"))
        ],
      ),
    );
  }
}
