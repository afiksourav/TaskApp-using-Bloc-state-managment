import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../blocs/bloc_exports.dart';
import '../models/task.dart';
import '../widgets/task_list.dart';
import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('recycle Bin'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: MyDrawer(),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text(
                      '${state.removedTasks.length} Tasks:',
                    ),
                  ),
                ),
                TasksList(tasksList: state.removedTasks)
              ]);
        },
      ),
    );
  }
}
