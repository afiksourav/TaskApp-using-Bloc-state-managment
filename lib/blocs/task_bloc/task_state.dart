part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<TaskModel> PendingTasks;
  final List<TaskModel> CompletedTasks;
  final List<TaskModel> FavoriteTasks;
  final List<TaskModel> removedTasks;

  const TaskState({
    this.PendingTasks = const <TaskModel>[],
    this.CompletedTasks = const <TaskModel>[],
    this.FavoriteTasks = const <TaskModel>[],
    this.removedTasks = const <TaskModel>[],
  });

  @override
  List<Object> get props =>
      [PendingTasks, CompletedTasks, FavoriteTasks, removedTasks];

//store data hydrid
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'PendingTasks': PendingTasks.map((x) => x.toMap()).toList(),
      'CompletedTasks': CompletedTasks.map((x) => x.toMap()).toList(),
      'FavoriteTasks': FavoriteTasks.map((x) => x.toMap()).toList(),
      'removedTasks': removedTasks.map((x) => x.toMap()).toList(),
    };
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
        PendingTasks: List<TaskModel>.from((map['PendingTasks']?.map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ))),
        CompletedTasks:
            List<TaskModel>.from((map['CompletedTasks']?.map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ))),
        FavoriteTasks:
            List<TaskModel>.from((map['FavoriteTasks']?.map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ))),
        removedTasks: List<TaskModel>.from((map['removedTasks']?.map<TaskModel>(
          (x) => TaskModel.fromMap(x as Map<String, dynamic>),
        ))));
  }
}
