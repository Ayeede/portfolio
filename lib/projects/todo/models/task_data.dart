import 'dart:collection';

import 'package:ayden_davis_portfolio_website/projects/todo/models/task_class.dart';
import 'package:flutter/material.dart';

class TaskData extends ChangeNotifier {
  final List<Tasks> _taskList = [];

  UnmodifiableListView<Tasks> get tasks {
    return UnmodifiableListView(_taskList);
  }

  void addTask(String taskName) {
    _taskList.add(Tasks(name: taskName));
    notifyListeners();
  }

  void updateTask(Tasks task) {
    task.toggleDone();
    notifyListeners();
  }

  void removeTask(Tasks task) {
    _taskList.remove(task);
    notifyListeners();
  }
}
