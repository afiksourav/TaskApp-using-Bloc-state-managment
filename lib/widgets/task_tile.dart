import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final TaskModel task;

  void _removeOrDeleteTask(BuildContext ctx, TaskModel taskModel) {
    taskModel.isDeleted!
        ? ctx.read<TaskBloc>().add(DeleteTask(task: task))
        : ctx.read<TaskBloc>().add(RemoveTask(task: task));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          task.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              decoration: task.isDone! ? TextDecoration.lineThrough : null),
        ),
        subtitle: Text(
          task.description,
          style: TextStyle(
              decoration: task.isDone! ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
            value: task.isDone,
            onChanged: task.isDeleted == false
                ? (value) {
                    context.read<TaskBloc>().add(UpdateTask(task: task));
                    print(task.isDone);
                  }
                : null),
        onLongPress: () => _removeOrDeleteTask(context, task));
  }
}
