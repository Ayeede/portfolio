import 'package:ayden_davis_portfolio_website/projects/todo/components/task_widget.dart';
import 'package:ayden_davis_portfolio_website/projects/todo/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 20),
        child: Consumer<TaskData>(
          builder: (context, data, child) {
            return ListView.builder(
              itemCount: data.tasks.length,
              itemBuilder: (context, index) {
                final task = data.tasks[index];
                return TaskWidget(
                  taskText: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    data.updateTask(task);
                  },
                  onLongPress: () {
                    data.removeTask(task);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
