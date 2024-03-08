import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo/tasks.dart';

class Todolist extends ChangeNotifier{

  bool check = false;

  List <Task> _tasks = [
    Task(todo: 'We will add this'),
    Task(todo: 'We add this'),
    Task(todo: 'We will add'),
  ];

  // because we made the task list private(which we really didn't have to, just for safety),
  // we now have to create this function so we can read through the list in the TaskList screen
  // the UnmodifiableListView just means a copy of _tasks that we can only view but not change or update
  UnmodifiableListView<Task> get onlyViewTask{
    return UnmodifiableListView(_tasks);
  }

  int get taskCount{ // this is called a getter
    return _tasks.length;
  }

  void addTask (String newTask){
    _tasks.add(Task(todo: newTask));
    notifyListeners(); // this will tell all the listeners to rebuild if stl or update if stf
  }

  void removeTask (String delete){
    List tasksCopy = List.from(_tasks);
    for (var task in tasksCopy) {
      if (task.todo == delete) {
        _tasks.remove(task); // modify the original list
      }
    }
    // with this loop we are iterating through a copy of the original list cause dart will not allow us to iterate a modify a list at the same time
    notifyListeners();
  }

  void checker (bool onChanged){
    check = onChanged;
    notifyListeners();
  }
}