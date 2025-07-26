import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.taskText, required this.isChecked, this.checkboxCallback, this.onLongPress});

  final String taskText;
  final ValueChanged? checkboxCallback;
  final bool isChecked;
  final GestureLongPressCallback? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: onLongPress,
        leading: Text(
          taskText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            decoration: isChecked ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,
          value: isChecked,
          onChanged: checkboxCallback,
        ));
  }
}
