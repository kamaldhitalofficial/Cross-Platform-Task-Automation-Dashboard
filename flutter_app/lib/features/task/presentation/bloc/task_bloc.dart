import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_automation/features/task/domain/entities/task_entity.dart';
import 'package:task_automation/features/task/domain/usecases/add_task.dart';
import 'package:task_automation/features/task/domain/usecases/toggle_task.dart';
import 'package:task_automation/features/task/presentation/bloc/task_event.dart';
import 'package:task_automation/features/task/presentation/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final AddTask addTask;
  final ToggleTask toggleTask;

  TaskBloc({required this.addTask, required this.toggleTask})
    : super(TaskInitial()) {
    on<LoadTasksEvent>((event, emit) async {
      emit(TaskLoaded([])); // Initialize with empty list
    });

    on<AddTaskEvent>((event, emit) async {
      await addTask(event.title);
      if (state is TaskLoaded) {
        final currentTasks = (state as TaskLoaded).tasks;
        emit(
          TaskLoaded([
            ...currentTasks,
            TaskEntity(id: DateTime.now().toString(), title: event.title),
          ]),
        );
      } else {
        emit(
          TaskLoaded([
            TaskEntity(id: DateTime.now().toString(), title: event.title),
          ]),
        );
      }
    });

    on<ToggleTaskEvent>((event, emit) async {
      await toggleTask(event.id);
      if (state is TaskLoaded) {
        final currentTasks = (state as TaskLoaded).tasks;
        final updatedTasks = currentTasks.map((task) {
          if (task.id == event.id) {
            return TaskEntity(
              id: task.id,
              title: task.title,
              isCompleted: !task.isCompleted,
            );
          }
          return task;
        }).toList();
        emit(TaskLoaded(updatedTasks));
      }
    });
  }
}
