import 'package:task_automation/features/task/domain/repositories/task_repository.dart';

class ToggleTask {
  final TaskRepository repository;

  ToggleTask(this.repository);

  Future<void> call(String id) async {
    await repository.toggleTask(id);
  }
}
