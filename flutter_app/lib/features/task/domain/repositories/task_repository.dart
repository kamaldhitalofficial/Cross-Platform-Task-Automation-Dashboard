import 'package:task_automation/features/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<void> addTask(String title);
  Future<void> toggleTask(String id);
}
