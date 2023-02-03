// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:taskapp/blocs/bloc_exports.dart';
// import 'package:taskapp/models/task.dart';

// class damoScreen extends StatelessWidget {
//   damoScreen({super.key});

//   TextEditingController titleController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tasks App'),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.add),
//           )
//         ],
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: Chip(
//               label: Text(
//                 'Tasks:',
//               ),
//             ),
//           ),
//           BlocBuilder<TaskBloc, TaskState>(
//             builder: (context, state) {
//               List<TaskModel> taskList = state.allTasks;
//               return Expanded(child: ListView.builder(
//                itemCount: taskList.length,
//                itemBuilder: (context,index){
//                  return Container(
//                    height: 200,
//                    child: Column(
//                     children: [
//                      Text(taskList[index].title)
//                     ],
//                    ),
//                  );
//                }
//                ));
//             },
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) => SingleChildScrollView(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).viewInsets.bottom),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       const Text(
//                         "Add Task",
//                         style: TextStyle(fontSize: 24),
//                       ),
//                       TextField(
//                         autofocus: true,
//                         controller: titleController,
//                         decoration:
//                             InputDecoration(border: OutlineInputBorder()),
//                       ),
//                       ElevatedButton(
//                           onPressed: () {
//                             var task = TaskModel(title: titleController.text);
//                             context.read<TaskBloc>().add(AddTask(task: task));
//                             print(task);
//                           },
//                           child: Text('Add Task')),
//                       TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Cancle'))
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//         tooltip: 'Add Task',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
