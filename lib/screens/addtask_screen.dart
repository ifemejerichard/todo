import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/r_widgets/todo_list.dart';

class AddTask extends StatefulWidget {

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {

  late String typedMessage;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of (context).viewInsets.bottom), // this will make sure the keyboard does not block the modalbuttomsheet
      child: Column(
        mainAxisSize: MainAxisSize.min, // this will make sure the bottom sheet remains as small as it need to be
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Add Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.lightBlueAccent, fontWeight: FontWeight.w600, fontSize: 30
                      ),
                    ),
                    TextField(
                      autofocus: true,
                      onChanged: (value) {
                        typedMessage = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.lightBlueAccent)),
                      onPressed: (){
                        Provider.of<Todolist>(context, listen: false).addTask(typedMessage);
                        Navigator.pop(context);
                      }, child: const Text('Add', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500, color: Colors.white),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
