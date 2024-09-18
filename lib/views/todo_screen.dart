import 'package:Todo_list_app/models/todo.dart';
import 'package:Todo_list_app/styles/colors.dart';

import '../styles/font.dart';

import '../widgets/todo_item_widget.dart';
import 'package:flutter/material.dart';

import '../controllers/todo_controller.dart';
import '../widgets/add_todo_bottom_sheet.dart';
import 'package:Todo_list_app/extensions/date.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}
class _TodoScreenState extends State<TodoScreen> {
  TodoController _todoController = TodoController();
  List <Todo> todosFiltered=[];
  DateTime? _date = DateTime.now().dateOnly();

  String title() {
    if (_date == DateTime.now().dateOnly()) {
      return 'Today';
    } else if (_date == DateTime.now().dateOnly().subtract(Duration(days: 1))) {
      return 'Yesterday';
    } else if (_date == DateTime.now().dateOnly().add(Duration(days: 1))) {
      return 'Tomorrow';
    } else {
      return _date!.dayName();
    }
  }

  String subtitle() => _date!.toFormattedString();
  
  void filterTodos(){
    todosFiltered=List.from(_todoController.filteredTodos(_date!));
  }
  void _selectDate() async {
    _date = await showDatePicker(
          context: context,
          firstDate: DateTime(2017),
          lastDate: DateTime(2099),
          initialDate: _date,
        ) ??
        _date;
    _date = _date!.dateOnly();
    filterTodos();
    setState(() {
    });
  }

  Widget todoListView(){
    return ListView.builder(
                itemCount: todosFiltered.length,
                itemBuilder: (context, index) {
                  final todo = todosFiltered[index];
                  return TodoItemWidget(
                    key: ValueKey(todo.id),
                    todo: todo,
                    onDelete: () {
                      _todoController.deleteTodo(todo);
                      setState(() {});
                    },
                    onToggleCompleted: () {
                      _todoController.toggleComplete(todo);
                      setState(() {});
                    },
                    onUpdate: (updatedTodo) {
                      _todoController.updateTodo(updatedTodo);
                      setState(() {});
                    },
                  );
                },
              );
  }
  @override
  Widget build(BuildContext context) {
    //todosFiltered=_todoController.filteredTodos(_date!);
    filterTodos();
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title(),
              style: AppTextStyles.title,
            ),
            Row(
              children: [
                Text(
                  subtitle(),
                  style:
                      AppTextStyles.title.copyWith(color: AppColors.lightBlack),
                ),
                IconButton(
                  onPressed: () {
                    _selectDate();
                    setState(() {
                      
                    });
                  },
                  icon: Icon(Icons.calendar_month),
                  color: AppColors.lightBlack,
                )
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: todoListView(),
            ),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (_) => Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: AddTodoBottomSheet(
                            dateTime: _date!.merged(TimeOfDay.now()),
                            onAdd: (todo) {
                              setState(() {
                                _todoController.addTodo(todo);
                              });
                            },
                          ),
                        ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add,size: 35,color: AppColors.white,),
                  const Text(
                    'Add task',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
