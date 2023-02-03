import 'package:flutter/material.dart';
import 'package:taskapp/blocs/bloc_exports.dart';
import 'package:taskapp/models/task.dart';

import 'package:taskapp/widgets/task_list.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<TaskModel> taskList = state.CompletedTasks;
        return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(
            child: Chip(
              label: Text(
                '${taskList.length} Tasks:',
              ),
            ),
          ),
          TasksList(tasksList: taskList)
        ]);
      },
    );
  }
}
