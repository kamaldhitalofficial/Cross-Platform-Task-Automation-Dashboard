import 'package:task_automation/features/task/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.id,
    required super.title,
    super.isCompleted = false,
  });

  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
    );
  }

  TaskEntity toEntity() {
    return TaskEntity(id: id, title: title, isCompleted: isCompleted);
  }
}
