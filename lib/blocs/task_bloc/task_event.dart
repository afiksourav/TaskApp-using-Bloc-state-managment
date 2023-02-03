part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];

}

  class AddTask extends TaskEvent{
    final TaskModel task;
    const AddTask({
      required this.task,
    });
    @override
    List<Object> get props => [task]; //?????
  }

  class UpdateTask extends TaskEvent{
    final TaskModel task;
    const UpdateTask({
      required this.task,
    });
    @override
    List<Object> get props => [task];
  }

  class DeleteTask extends TaskEvent{
    final TaskModel task;
    const DeleteTask({
      required this.task,
    });
    @override
    List<Object> get props => [task];
  }

    class RemoveTask extends TaskEvent{
    final TaskModel task;
    const RemoveTask({
      required this.task,
    });
    @override
    List<Object> get props => [task];
  }
