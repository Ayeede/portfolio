import 'package:cv_main_project/projects/todo/constant.dart';
import 'package:cv_main_project/projects/todo/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskAddScreen extends StatelessWidget {
  const TaskAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      padding: MediaQuery.of(context).viewInsets,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: SizedBox(
        width: double.infinity,
        height: 400,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              Column(
                children: [
                  Center(
                    child: Text('Add Task', style: TextStyle(color: kPrimaryColor, fontSize: 24)),
                  ), //Title
                  TextField(
                    autofocus: true,
                    onChanged: (value) {
                      newTaskTitle = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter a task',
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: kPrimaryColor, width: 3)),
                    ),
                  ), //TextField
                ],
              ),

              Material(
                color: kPrimaryColor,
                child: TextButton(
                  onPressed: () {
                    try {
                      Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                      Navigator.pop(context);
                    } catch (e) {
                      debugPrint('$e');
                    }
                  },
                  child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ), //Button - rectangular
            ],
          ),
        ),
      ),
    );
  }
}
