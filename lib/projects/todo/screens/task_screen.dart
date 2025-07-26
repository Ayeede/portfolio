import 'package:cv_main_project/projects/todo/components/task_list.dart';
import 'package:cv_main_project/projects/todo/constant.dart';
import 'package:cv_main_project/projects/todo/models/task_data.dart';
import 'package:cv_main_project/projects/todo/screens/task_add.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    int tasksNumber = Provider.of<TaskData>(context).tasks.length;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 20, right: 40, left: 40),
              child: Column(
                spacing: 20,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text components
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "Todoey",
                        style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                      ), // Title
                      Text('$tasksNumber Tasks', style: TextStyle(color: Colors.white, fontSize: 18)), // Tasks
                    ],
                  ),
                ],
              ),
            ),
          ), // Top Section
          Expanded(
            flex: 2,
            child: Padding(padding: const EdgeInsets.only(top: 20), child: TaskList()),
          ), // Bottom Section | Task list + Task add.
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 40.0, bottom: 20),
        child: FloatingActionButton(
          elevation: 5,
          backgroundColor: kPrimaryColor,
          shape: CircleBorder(),
          onPressed: () {
            showModalBottomSheet(isScrollControlled: true, context: context, builder: (context) => TaskAddScreen());
          },
          child: Icon(Icons.add, size: 40, color: Colors.white),
        ),
      ),
    );
  }
}
