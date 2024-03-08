import 'package:flutter/material.dart';
import 'package:todo/r_widgets/task_tile.dart';
import 'package:todo/r_widgets/todo_list.dart';
import 'package:provider/provider.dart';

class TasksList extends StatefulWidget {

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {

  @override
  Widget build(BuildContext context) {
    // the listview builder is different from the listview cause it is more efficient and saves more resources
    return ListView.builder(itemBuilder: (context, index) {
      return TaskTile(
          todoText: Provider.of<Todolist>(context).onlyViewTask[index].todo,
          isChecked: Provider.of<Todolist>(context).onlyViewTask[index].state
      );
    },
      itemCount: Provider.of<Todolist>(context).taskCount,
    );
  }
}
