import 'package:equatable/equatable.dart';
import 'package:taskapp/blocs/bloc_exports.dart';
import 'package:taskapp/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        PendingTasks: List.from(state.PendingTasks)..add(event.task),
        CompletedTasks: state.CompletedTasks,
        FavoriteTasks: state.FavoriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    List<TaskModel> pendingTasks = state.PendingTasks;
    List<TaskModel> CompletedTasks = state.CompletedTasks;
    event.task.isDone == false
        ? {
            pendingTasks = List.from(pendingTasks)..remove(event.task),
            CompletedTasks = List.from(CompletedTasks)
              ..insert(0, event.task.copyWith(isDone: true)),
          }
        : {
            CompletedTasks = List.from(CompletedTasks)..remove(event.task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, event.task.copyWith(isDone: false))
          };
    emit(TaskState(
        PendingTasks: pendingTasks,
        CompletedTasks: CompletedTasks,
        FavoriteTasks: state.FavoriteTasks,
        removedTasks: state.removedTasks));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final task = this.state;
    emit(TaskState(
        PendingTasks: state.PendingTasks,
        CompletedTasks: state.CompletedTasks,
        FavoriteTasks: state.FavoriteTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task)));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) {
    final task = this.state;
    emit(TaskState(
        PendingTasks: List.from(state.PendingTasks)..remove(event.task),
        CompletedTasks: List.from(state.CompletedTasks)..remove(event.task),
        FavoriteTasks: List.from(state.FavoriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(event.task.copyWith(isDeleted: true))));
  }

//store data
  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    // TODO: implement toJson
    return state.toMap();
  }
}
