import 'package:flutter/material.dart';

class Task {
  final String description;
  bool isCompleted;

  Task(this.description, {this.isCompleted = false});

  static Widget tasks(List<Task> tasks) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        Task task = tasks[index];
        return CheckboxListTile(
          title: Text(task.description),
          value: task.isCompleted,
          onChanged: null,
          controlAffinity: ListTileControlAffinity.leading,
        );
      },
    );
  }
}
