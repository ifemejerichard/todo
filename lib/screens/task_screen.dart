import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/r_widgets/todo_list.dart';
import 'package:todo/screens/addtask_screen.dart';
import 'package:todo/r_widgets/tasks_list.dart';
import 'package:todo/tasks.dart';

class TasksScreens extends StatefulWidget {
  const TasksScreens({super.key});

  @override
  State<TasksScreens> createState() => _TasksScreensState();
}

class _TasksScreensState extends State<TasksScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        onPressed: (){
          showModalBottomSheet(
            // this will make the bottomsheet transparent allowing us to build another white container inside the sheet
              backgroundColor: Colors.white.withOpacity (0),
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return AddTask();
              });
          },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35, backgroundColor: Colors.white,
                      child: Icon(
                        Icons.list, size: 50, color: Colors.lightBlue,
                      ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Todoey', style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                      textHeightBehavior: TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                      ),
                  ),
                  Text('${Provider.of<Todolist>(context).taskCount} Tasks', style: TextStyle(color: Colors.white, fontSize: 20),
                    textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ),
      )
    );
  }
}
