import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc_exports.dart';
import 'package:taskapp/models/task.dart';

import 'package:taskapp/widgets/task_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> taskList = state.PendingTasks;
        return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Chip(
              label: Text(
                '${taskList.length} Pending | ${state.CompletedTasks.length} Completed ${state.FavoriteTasks} Favorite ',
              ),
            ),
          ),
          TasksList(tasksList: taskList)
        ]);
      },
    );
  }
}
