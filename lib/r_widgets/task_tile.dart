
import 'package:flutter/material.dart';
import 'package:todo/r_widgets/todo_list.dart';
import 'package:provider/provider.dart';

class TaskTile extends StatefulWidget {

  bool isChecked;
  final String todoText;

  TaskTile({super.key, required this.todoText, required this.isChecked});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){
        Provider.of<Todolist>(context, listen: false).removeTask(widget.todoText);
      },
      title: Text(widget.todoText,
        style: TextStyle(
          decoration: widget.isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
          value: widget.isChecked,
          activeColor: Colors.lightBlueAccent,
          onChanged: (onChanged){ // the onchanged will auto change when ever we click the checkbox
            setState(() {
              widget.isChecked = onChanged!; // the '!' is a null checker
            });
          }
      ),
    );
  }
}




