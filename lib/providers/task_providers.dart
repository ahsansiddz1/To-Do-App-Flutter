import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../modules/task.dart';

class TaskProvider extends ChangeNotifier {
  get getTasks {
    return tasks;
  }

  List<Task> tasks = [];

  addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

    removeTask(int index) {
     tasks.removeAt(index);
  }
}
