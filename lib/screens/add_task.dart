import 'package:flutter/material.dart';
import 'package:taskapp/servises/giid_gen.dart';
import '../blocs/bloc_exports.dart';
import '../models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Add Task",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: TextField(
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Title'),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              autofocus: true,
              minLines: 3,
              maxLines: 5,
              controller: descriptionController,
              decoration: const InputDecoration(
                label: Text('Description'),
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      var task = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          id: GUIDGen.generate());
                      context.read<TaskBloc>().add(AddTask(task: task));
                      //BlocProvider.of<TaskBloc>(context).add(AddTask(task: task));
                      Navigator.pop(context);
                    },
                    child: Text('Add')),
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('Cancel'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
