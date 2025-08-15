import 'package:task_automation/features/task/data/repositories/task_repository_impl.dart';
import 'package:task_automation/features/task/domain/repositories/task_repository.dart';
import 'package:task_automation/features/task/domain/usecases/add_task.dart';
import 'package:task_automation/features/task/domain/usecases/toggle_task.dart';
import 'package:task_automation/features/task/presentation/bloc/task_bloc.dart';

class InjectionContainer {
  static TaskRepository taskRepository = TaskRepositoryImpl();
  static AddTask addTask = AddTask(taskRepository);
  static ToggleTask toggleTask = ToggleTask(taskRepository);
  static TaskBloc taskBloc = TaskBloc(addTask: addTask, toggleTask: toggleTask);
}
