import 'package:task_automation/features/task/data/models/task_model.dart';
import 'package:task_automation/features/task/domain/entities/task_entity.dart';
import 'package:task_automation/features/task/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final List<TaskModel> _tasks = [];

  @override
  Future<List<TaskEntity>> getTasks() async {
    return _tasks.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addTask(String title) async {
    _tasks.add(TaskModel(id: DateTime.now().toString(), title: title));
  }

  @override
  Future<void> toggleTask(String id) async {
    final index = _tasks.indexWhere((task) => task.id == id);
    if (index != -1) {
      _tasks[index] = TaskModel(
        id: _tasks[index].id,
        title: _tasks[index].title,
        isCompleted: !_tasks[index].isCompleted,
      );
    }
  }
}
