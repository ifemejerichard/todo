import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/r_widgets/todo_list.dart';
import 'package:todo/screens/task_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Todolist>(
      create: (BuildContext context) {
        return Todolist();
      },
      child: MaterialApp(
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        home: const TasksScreens(),
      ),
    );
  }
}

