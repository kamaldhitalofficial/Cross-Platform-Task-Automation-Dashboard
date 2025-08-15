abstract class TaskEvent {}

class AddTaskEvent extends TaskEvent {
  final String title;
  AddTaskEvent(this.title);
}

class ToggleTaskEvent extends TaskEvent {
  final String id;
  ToggleTaskEvent(this.id);
}

class LoadTasksEvent extends TaskEvent {}
