import 'package:task_automation/features/task/domain/repositories/task_repository.dart';

class AddTask {
  final TaskRepository repository;

  AddTask(this.repository);

  Future<void> call(String title) async {
    await repository.addTask(title);
  }
}
